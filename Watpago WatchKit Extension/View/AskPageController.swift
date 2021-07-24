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

    var typedText: NSString = ""
    var selectedLanguage = "in English"
    var language = "en"

    var languages = [("in English", "en"), ("in French", "fr")]
    var translatedText: String = ""
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

        let pickerItems: [WKPickerItem] = languages.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            return pickerItem
        }

        languagePicker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func TypingEnded(_ value: NSString?) {
        typedText = value ?? ""
    }

    @IBAction func pickerSelected(_ value: Int) {
        selectedLanguage = languages[value].0
        language = languages[value].1
    }

    @IBAction func ShowmeButtonPressed() {
        if typedText == "" {
            InputTextField.setPlaceholder("!입력해주세요!")
        } else {
            ShowmeButton.setEnabled(false)
            let text = typedText as String
            descriptionText = "\"\(text)\"\n\(selectedLanguage) is"

            self.apiCaller.RequestTranslation(text, self.language)
        }
    }

    func sendTranslatedText(_ resultText: String) {
        translatedText = resultText

        DispatchQueue.main.async {
            self.pushController(withName: "resultPage", context: (self.descriptionText, self.translatedText))
        }
    }

}
