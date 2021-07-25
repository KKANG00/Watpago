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
    var selectedLanguageIndex: Int?

    let synthesizer = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance?

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        self.setTitle("다시하기")
        let tuple = context as! (String, String, Int)
        let description = tuple.0
        let resultText = tuple.1
        selectedLanguageIndex = tuple.2

        translatedText = resultText

        descriptionLabel.setText(description)
        outputLabel.setText(resultText)

        utterance = AVSpeechUtterance(string: translatedText ?? "")
        if let index = selectedLanguageIndex {
            utterance!.voice = AVSpeechSynthesisVoice(language: Languages.languages[index].voiceShort)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to users
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func SpeakBtnPressed() {
        synthesizer.speak(utterance!)
    }

}
