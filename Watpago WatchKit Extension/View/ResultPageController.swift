//
//  OutputController.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/23.
//

import WatchKit
import Foundation
import AVFoundation

class ResultPageController: WKInterfaceController {
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var outputLabel: WKInterfaceLabel!

    var translatedText: String?

    let synthesizer = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance?
    var vshort = ""

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        self.setTitle("다시하기")
        let tuple = context as! (String, String, String)
        let description = tuple.0
        let resultText = tuple.1
        vshort = tuple.2

        translatedText = resultText

        descriptionLabel.setText(description)
        outputLabel.setText(resultText)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to users
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func SpeakBtnPressed() {
        utterance = AVSpeechUtterance(string: translatedText ?? "")
        utterance!.voice = AVSpeechSynthesisVoice(language: vshort)
        utterance!.volume = UserDefaults.standard.float(forKey: "Volume")

        synthesizer.speak(utterance!)
    }

}
