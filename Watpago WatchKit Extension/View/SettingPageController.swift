//
//  SettingPageController.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/26.
//

import Foundation

import WatchKit
import Foundation

class SettingPageController: WKInterfaceController {
    @IBOutlet weak var languageTable: WKInterfaceTable!
    @IBOutlet weak var speakVolume: WKInterfaceSlider!
    @IBOutlet weak var saveButton: WKInterfaceButton!

    var languages = defaultLanguages.Languages.map { $0.0 }
    var userdefaultLanguateState = UserDefaults.standard.array(forKey: "LanguageState") as? [Bool] ??
                                    [Bool].init(repeating: true, count: defaultLanguages.Languages.count)
    var userdefaultVolume = UserDefaults.standard.float(forKey: "Volume")

    override func awake(withContext context: Any?) {
    }

    override func willActivate() {
        userdefaultLanguateState = UserDefaults.standard.array(forKey: "LanguageState")
            as? [Bool] ?? userdefaultLanguateState
        userdefaultVolume = UserDefaults.standard.float(forKey: "Volume")
        loadTable()
        speakVolume.setValue(userdefaultVolume)
    }

    override func willDisappear() {
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let row = table.rowController(at: rowIndex) as! languageTableCell
        userdefaultLanguateState[rowIndex] = !userdefaultLanguateState[rowIndex]

        DispatchQueue.main.async {
            row.languageTitle.setTextColor(self.userdefaultLanguateState[rowIndex] ? .white : .gray)
        }
    }

    func loadTable() {
        languageTable.setNumberOfRows(languages.count, withRowType: "languageTableCell")

        var index = 0
        for lan in languages {
            let row = languageTable.rowController(at: index) as! languageTableCell
            row.languageTitle.setText(lan)
            row.languageTitle.setTextColor(userdefaultLanguateState[index] ? .white : .gray)
            index += 1
        }
    }

    @IBAction func SetVolume(_ value: Float) {
        userdefaultVolume = value
    }

    @IBAction func saveButtonPressed() {
        if userdefaultLanguateState.filter({$0}).count > 0 {
            UserDefaults.standard.set(userdefaultLanguateState, forKey: "LanguageState")
            UserDefaults.standard.set(userdefaultVolume, forKey: "Volume")

            DispatchQueue.main.async {
                self.saveButton.setBackgroundColor(UIColor(displayP3Red: 78.0/255.0, green: 195.0/255.0, blue: 60.0/255.0, alpha: 1))
                self.saveButton.setTitle("Done!")
            }

            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.gobackSave()
            }
        }
    }

    func gobackSave() {
        self.saveButton.setBackgroundColor(UIColor(displayP3Red: 76.0/255.0, green: 170.0/255.0, blue: 222.0/255.0, alpha: 1))
        saveButton.setTitle("Save")
    }
}

class languageTableCell: NSObject {
    @IBOutlet weak var languageTitle: WKInterfaceLabel!
}
