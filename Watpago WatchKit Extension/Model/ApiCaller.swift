//
//  ApiCaller.swift
//  Watpago
//
//  Created by KKANG on 2021/07/23.
//

import Foundation
import UIKit

// MARK: - Data Model

struct response: Codable {
    let message: message
}

struct message: Codable {
    let result: result
}

struct result: Codable {
    let translatedText: String
}

protocol ApiCallerDelegate: AnyObject {
    func sendTranslatedText(_ resultText: String)
}

class ApiCaller {
    let ClientID = Apiconfig.ClientID
    let ClientSecret = Apiconfig.ClientSecret

    weak var delegate: ApiCallerDelegate?

    func RequestTranslation(_ text: String, _ language: String) {

        let param = "source=ko&target=\(language)&text=\(text)"
        let paramData = param.data(using: .utf8)
        let Naver_URL = URL(string: "https://openapi.naver.com/v1/papago/n2mt")

        var translatedText = ""

        // request
        var request = URLRequest(url: Naver_URL!)
        request.httpMethod = "POST"
        request.addValue(ClientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(ClientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = paramData
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")

        // Session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // Task
        let task = session.dataTask(with: request) { (data, _, error) in
            // 통신 성공
            if let data = data {
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(response.self, from: data) {
                    translatedText = json.message.result.translatedText

                    self.delegate?.sendTranslatedText(translatedText)
                }
            }
            // 통신 실패
            if let error = error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}
