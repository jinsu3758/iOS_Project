//
//  FoodTrackerTests.swift
//  TestCodeExampleTests
//
//  Created by 박진수 on 2020/06/03.
//  Copyright © 2020 박진수. All rights reserved.
//

import XCTest
@testable import TestCodeExample

class FoodTrackerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_createMeal() {
        let meal = Meal()
        
        XCTAssertNotNil(meal)
    }
    
    func test_mealInitialization() {
        let meal = Meal(name: "First meal", photo: nil, rating: 5)
        
        XCTAssertNotNil(meal)
    }
    
    func test_mealInitWithoutName() {
        let meal = Meal(name: "", photo: nil, rating: 5)
        
        XCTAssertNil(meal)
    }
    
    func test_initWithNegativeRank() {
        let meal = Meal(name: "meal", photo: nil, rating: -1)
        
        XCTAssertNil(meal)
    }
    

}
