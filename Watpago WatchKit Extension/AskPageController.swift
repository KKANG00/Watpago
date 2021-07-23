//
//  InterfaceController.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/23.
//

import WatchKit
import Foundation

class AskPageController: WKInterfaceController {
    @IBOutlet weak var InputTextField: WKInterfaceTextField!
    @IBOutlet weak var languagePicker: WKInterfacePicker!

    var typedText: NSString = ""
    var selectedLanguage = "in English"

    var languages = ["in English", "in French"]

    override func awake(withContext context: Any?) {
        // Configure interface objects here.

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        InputTextField.setPlaceholder("입력해주세요.")
        InputTextField.setText("")

        let pickerItems: [WKPickerItem] = languages.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
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
        selectedLanguage = languages[value]
    }

    @IBAction func ShowmeButtonPressed() {
        if typedText == "" {
            InputTextField.setPlaceholder("!입력해주세요!")
        } else {
            let description: String = "\"\(typedText)\"\n\(selectedLanguage) is"
            pushController(withName: "resultPage", context: description)
        }
    }

}
