//
//  defaultLanguages.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/27.
//

import Foundation

struct defaultLanguages {
    static let Languages = [("English", "en", "en-US"), ("French", "fr", "fr-FR"), ("Chinese", "zh-CN", "zh-CN"), ("Russian", "ru", "ru-RU"),
                            ("Thai", "th", "th-TH"), ("Indonesian", "id", "id-ID"), ("German", "de", "de-DE"), ("Italian", "it", "it-IT")]
                            .sorted(by: { return $0.0 < $1.0 })
}
