//
//  Languages.swift
//  Watpago WatchKit Extension
//
//  Created by KKANG on 2021/07/25.
//

import Foundation

struct Language {
    let pickerTitle: String
    let translateShort: String
    let voiceShort: String
    var selected: Bool

    init(_ pickertitle: String, _ tshort: String, _ vshort: String, _ selectedvalue: Bool) {
        pickerTitle = pickertitle
        translateShort = tshort
        voiceShort = vshort
        selected = selectedvalue
    }
}
