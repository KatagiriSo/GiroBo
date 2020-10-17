//
//  Load.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation
import Combine

func load<T:Decodable>(_ filename:String) -> AnyPublisher<T, Error> {
    let data:Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            return Fail(error: NSError(domain: "FILE", code: 1, userInfo: nil)).eraseToAnyPublisher()
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch  {
        return Fail(error: error).eraseToAnyPublisher()
    }
    
    do {
        let decoder = JSONDecoder()
        let obj = try decoder.decode(T.self, from: data)
        return Just(obj).setFailureType(to: Error.self).eraseToAnyPublisher()
    } catch {
        return Fail(error: error).eraseToAnyPublisher()
    }
}

func loadSync<T:Decodable>(_ filename:String) throws -> T {
    let data:Data
       
       guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
           else {
            throw(NSError(domain: "FILE", code: 1, userInfo: nil))
       }
       
       
       do {
           data = try Data(contentsOf: file)
       }
       
       do {
           let decoder = JSONDecoder()
           return try decoder.decode(T.self, from: data)
       }
}

