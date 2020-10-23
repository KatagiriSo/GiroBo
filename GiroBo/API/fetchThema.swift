//
//  fetchMessage.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation
import Combine

/// テーマ取得
func fetchThema(isTest:Bool = false) -> AnyPublisher<ThemaEntity, Error> {
    return fetchData(isTest: isTest, urlstr: "https://qiita.com/api/v2/items", file: "message.json")
}

/// プロフィール取得
func fetchProfile(isTest:Bool = false) -> AnyPublisher<Profile, Error> {
    return fetchData(isTest: isTest, urlstr: "https://qiita.com/api/v2/items", file: "profile.json")
}
