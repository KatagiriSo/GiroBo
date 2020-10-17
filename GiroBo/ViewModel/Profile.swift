//
//  Profile.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation

struct Profile : Codable, Hashable {
    let name:String
}

func dummyProfile() -> Profile {
    return Profile(name: "")
}
