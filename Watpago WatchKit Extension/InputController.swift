//
//  InterfaceController.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/23.
//

import WatchKit
import Foundation


class InputController: WKInterfaceController {
    @IBOutlet weak var InputTextField: WKInterfaceTextField!
    @IBOutlet weak var languagePicker: WKInterfacePicker!
    
    var typedText: NSString = ""
    var selectedLanguage = ""
    
    var languages = ["in English", "in French"]
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
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
        let description = "\"\(typedText)\" \(selectedLanguage) is ..."
        
        presentController(withName: "output", context: description)
    }

}
