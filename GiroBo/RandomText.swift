//
//  RandomText.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/16.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation

struct RandomText {
    static let sei = ["佐藤", "織田", "木村", "藤井", "鈴木", "田中","細木", "田村", "清水", "木村", "土井", "土田"]
    static let mei = ["一郎", "二郎", "三郎", "花子", "佳奈子", "四郎", "五郎", "六郎", "七郎"]
    static let message = [
        "いろいろ考えたけど、そういうことじゃないんじゃないかなとおもうんだよね。",
        "ちょっとわからないです。",
        "なるほどね、わかった気がしないでもない。",
        "そう思うことは悪いことじゃないよ、だけど少しだけ気にしたほうが良い。",
        "賛成",
        "うーん",
        "こんなことを思いついたんだけど、忘れちゃった。",
        "そろそろ時間がきました"
    ]
    static func getName() -> String {
        return RandomText.sei.randomElement()! + RandomText.mei.randomElement()!
    }
    static func getMessage() -> String {
        return RandomText.message.randomElement()!
    }
    
}
