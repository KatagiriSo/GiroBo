//
//  fetchMessage.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation
import Combine

 func makeURL(_ name:String) -> String {
    let ret = "\(Const.apiBase)\(name)"
    print(ret)
    return ret
}

/// テーマ取得
func fetchThema(isTest:Bool = Const.isMock) -> AnyPublisher<ThemaEntity, Error> {
    return fetchData(isTest: isTest, urlstr: makeURL("items"), file: "message.json")
}

/// プロフィール取得
func fetchProfile(isTest:Bool = Const.isMock) -> AnyPublisher<Profile, Error> {
    return fetchData(isTest: isTest, urlstr: makeURL("items"), file: "profile.json")
}
