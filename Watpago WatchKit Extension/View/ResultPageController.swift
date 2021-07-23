//
//  OutputController.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/23.
//

import WatchKit
import Foundation

class ResultPageController: WKInterfaceController {
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var outputLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        self.setTitle("다시하기")
        let tuple = context as! (String, String)
        let description = tuple.0
        let resultText = tuple.1

        descriptionLabel.setText(description)
        outputLabel.setText(resultText)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to users
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}
