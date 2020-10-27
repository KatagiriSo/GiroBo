//
//  fetchData.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation
import Combine

func fetchData<T:Decodable>(isTest:Bool = false, urlstr:String, file:String) -> AnyPublisher<T, Error> {
    if isTest {
        return load(file)
    }
    
    let url = URL(string: urlstr)!
    let request = URLRequest(url:url)
    
    return URLSession.shared
        .dataTaskPublisher(for: request)
        .tryMap({ (data, response) -> Data in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(URLError.Code.badServerResponse)
            }
            return data
        })
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

func fetchDataTest(urlstr:String) -> AnyPublisher<String?, Error> {
    let url = URL(string: urlstr)!
    let request = URLRequest(url:url)

    return URLSession.shared
        .dataTaskPublisher(for: request)
        .tryMap({ (data, response) -> Data in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(URLError.Code.badServerResponse)
            }
            return data
        })
        .tryMap({(data:Data) -> Any in
             try JSONSerialization.jsonObject(with: data, options: [])
        })
        .map({(json:Any) in "\(json)"})
        .eraseToAnyPublisher()
}
