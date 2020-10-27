//
//  Const.swift
//  GiroBo
//
//  Created by Katagiri11 on 2020/10/27.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation

struct Const {
    static var apiBase: String {
        #if MOCK
            return "http://katagiriso.local:3000/api/v1/"
        #elseif DEBUG
            return "http://katagiriso.local:3000/api/v1/"
        #else
            return "https://qiita.com/api/v2/"
        #endif
    }
    
    static var isMock: Bool {
        #if MOCK
            return true
        #else
            return false
        #endif
    }
}
