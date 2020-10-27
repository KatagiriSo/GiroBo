//
//  GiroBoTests.swift
//  GiroBoTests
//
//  Created by KatagiriSo on 2020/10/14.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import XCTest
@testable import GiroBo

class GiroBoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        print(dummyEntity().messageList.debugDescription)
    }
    
    func testFetchData() throws {
        let _ = fetchDataTest(urlstr: "https://qiita.com/api/v2/items")
            .sink(receiveCompletion: { (comp) in
                switch comp {
                case .failure(let e):
                    print(e)
                    break
                case .finished:
                    print("finished")
                    break
                }
            }) { (res) in
                print(res!)
        }
    }
    
    func testDummyEntity() throws {
        XCTAssert(dummyEntity().messageList.count > 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
