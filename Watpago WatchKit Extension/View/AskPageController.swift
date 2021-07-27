//
//  InterfaceController.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/23.
//

import WatchKit
import Foundation

class AskPageController: WKInterfaceController, ApiCallerDelegate {
    @IBOutlet weak var InputTextField: WKInterfaceTextField!
    @IBOutlet weak var languagePicker: WKInterfacePicker!
    @IBOutlet weak var ShowmeButton: WKInterfaceButton!

    var UsingLanguages: [Bool] = UserDefaults.standard.array(forKey: "LanguageState") as? [Bool] ??
                                    [Bool].init(repeating: true, count: defaultLanguages.Languages.count)

    var userSetting: Settings = Settings([])
    var languages: [Language] = []

    var typedText: NSString = ""

    var selectedLanguageIndex = 0
    var selectedPickerTitle = ""
    var selectedtranslateShort = ""
    var selectedvoiceShort = ""

    var descriptionText: String = ""

    let apiCaller = ApiCaller()

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        apiCaller.delegate = self

        // initial volume
        let savedVolume = UserDefaults.standard.float(forKey: "Volume")
        if savedVolume == 0 {
            UserDefaults.standard.set(0.5, forKey: "Volume")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        InputTextField.setPlaceholder("입력해주세요.")
        InputTextField.setText("")
//        InputTextField.setText("안녕하세요.")
        ShowmeButton.setEnabled(true)

        UsingLanguages = UserDefaults.standard.array(forKey: "LanguageState") as? [Bool] ?? UsingLanguages
        userSetting = Settings(UsingLanguages)
        languages = userSetting.languages.filter {
            return $0.selected
        }

        let pickerItems: [WKPickerItem] = languages
            .map {
                let pickerItem = WKPickerItem()
                pickerItem.title = "in \($0.pickerTitle)"
                return pickerItem
            }

        languagePicker.setItems(pickerItems)
        selectedLanguageIndex = 0
        languagePicker.setSelectedItemIndex(selectedLanguageIndex)
        selectedPickerTitle = languages[selectedLanguageIndex].pickerTitle
        selectedtranslateShort = languages[selectedLanguageIndex].translateShort
        selectedvoiceShort = languages[selectedLanguageIndex].voiceShort

    }

    @IBAction func TypingEnded(_ value: NSString?) {
        typedText = value ?? ""
    }

    @IBAction func pickerSelected(_ value: Int) {
        selectedPickerTitle = languages[value].pickerTitle
        selectedLanguageIndex = value
        selectedtranslateShort = languages[value].translateShort
        selectedvoiceShort = languages[value].voiceShort
    }

    @IBAction func ShowmeButtonPressed() {
        if typedText == "" {
            InputTextField.setPlaceholder("!입력해주세요!")
        } else {
            ShowmeButton.setEnabled(false)

            let text = typedText as String
            descriptionText = "\"\(text)\"\nin \(selectedPickerTitle) is"

            self.apiCaller.RequestTranslation(text, self.selectedtranslateShort)
        }
    }

    func sendTranslatedText(_ resultText: String) {
        DispatchQueue.main.async {
            self.pushController(withName: "ResultPage", context: (self.descriptionText, resultText, self.selectedvoiceShort))
        }
    }

}
