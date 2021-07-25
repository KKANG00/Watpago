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

    var languages = Languages.languages

    var typedText: NSString = ""

    var selectedLanguageIndex = 0
    var selectedPickerTitle = ""
    var selectedtranslateShort = ""

    var descriptionText: String = ""

    let apiCaller = ApiCaller()

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        apiCaller.delegate = self

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        InputTextField.setPlaceholder("입력해주세요.")
        InputTextField.setText("")
        ShowmeButton.setEnabled(true)

        let pickerItems: [WKPickerItem] = languages
            .sorted(by: { return $0.pickerTitle < $1.pickerTitle
        }).map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.pickerTitle
            return pickerItem
        }

        languagePicker.setItems(pickerItems)

        selectedLanguageIndex = 0
        selectedPickerTitle = languages[selectedLanguageIndex].pickerTitle
        selectedtranslateShort = languages[selectedLanguageIndex].translateShort
    }

    @IBAction func TypingEnded(_ value: NSString?) {
        typedText = value ?? ""
    }

    @IBAction func pickerSelected(_ value: Int) {
        selectedPickerTitle = languages[value].pickerTitle
        selectedLanguageIndex = value
        selectedtranslateShort = languages[value].translateShort
    }

    @IBAction func ShowmeButtonPressed() {
        if typedText == "" {
            InputTextField.setPlaceholder("!입력해주세요!")
        } else {
            ShowmeButton.setEnabled(false)

            let text = typedText as String
            descriptionText = "\"\(text)\"\n\(selectedPickerTitle) is"

            self.apiCaller.RequestTranslation(text, self.selectedtranslateShort)
        }
    }

    func sendTranslatedText(_ resultText: String) {
        DispatchQueue.main.async {
            self.pushController(withName: "resultPage", context: (self.descriptionText, resultText, self.selectedLanguageIndex))
        }
    }

}
