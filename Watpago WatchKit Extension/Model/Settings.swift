//
//  Languages.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/25.
//

import Foundation

struct Settings {
    var languages: [Language] = []
    var Volume: Float

    init(_ languageState: [Bool], _ volume: Float) {
        if languageState.isEmpty {
            languages = []
        } else {
            var i = 0
            for lan in defaultLanguages.Languages {
                languages.append(Language(lan.0, lan.1, lan.2, languageState[i]))
                i += 1
            }
        }

        Volume = volume
    }
}

// 한국어(ko)-영어(en), en-US
// 한국어(ko)-일본어(ja), ja-JP
// 한국어(ko)-중국어 간체(zh-CN), zh-CN
// 한국어(ko)-스페인어(es), es-ES
// 한국어(ko)-프랑스어(fr), fr-FR
// 한국어(ko)-러시아어(ru), ru-RU
// 한국어(ko)-태국어(th), th-TH
// 한국어(ko)-인도네시아어(id), id-ID
// 한국어(ko)-독일어(de), de-DE
// 한국어(ko)-이탈리아어(it), it-IT

// 한국어(ko)-중국어 번체(zh-TW),
// 한국어(ko)-베트남어(vi),
