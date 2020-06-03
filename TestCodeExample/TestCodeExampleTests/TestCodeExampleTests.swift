//
//  TestCodeExampleTests.swift
//  TestCodeExampleTests
//
//  Created by 박진수 on 2020/06/02.
//  Copyright © 2020 박진수. All rights reserved.
//

import XCTest
@testable import TestCodeExample

class TestCodeExampleTests: XCTestCase {

    // 테스트를 하기 위해 초기화를 하는 부분
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_convertIntToPrice() {
        // given 필요한 어떤 값을 셋업
        let vc = ViewController()
        
        // when 테스트 하고자 하는 코드를 불러옴
        let moneyValue = vc.convertToPrice(value: 1000)
        let expectValue = "1,000"
        
        // then 당신이 기대하는 결과값과 비교하여 결과를 출력
        XCTAssertEqual(moneyValue, expectValue, "값이 일치하지 않습니다.")
        
    }

    func testExample() throws {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws { 
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
