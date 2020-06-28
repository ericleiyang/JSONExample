//
//  JSONArrayTests.swift
//  
//
//  Created by Eric Yang on 28/6/20.
//

import XCTest
import SwiftyJSON
@testable import JSONExample

final class JSONArrayTests: XCTestCase {
    var data: Data!
    var decoder: JSONDecoder!
    
    override func setUp() {
        guard let decoded = FileService.read(from: "Comment") else {
            return XCTFail()
        }
        data = decoded
        decoder = JSONDecoder()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSwiftJSON() {
        measure {
            for _ in 1...10000 {
                let temp = try! JSON(data: data)
                let t = Tweet(json: temp)
            }
        }
    }
    
    func testJSONSerialization() {
        measure {
            for _ in 1...10000 {
                let temp = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                let t = Tweet(dict: temp)
            }
        }
    }
    
    func testJSONDecoder() {
        measure {
            for _ in 1...10000 {
                do {
                    let _ = try decoder.decode(Tweet.self, from: data)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
