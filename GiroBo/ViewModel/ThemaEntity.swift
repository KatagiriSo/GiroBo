//
//  Thema.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation

struct ThemaEntity : Codable, Hashable {
    let thema:String
    let messageList:[Message]
}


func dummyEntity()->ThemaEntity {
    let x:ThemaEntity = try! loadSync("message.json")
    return x
}
