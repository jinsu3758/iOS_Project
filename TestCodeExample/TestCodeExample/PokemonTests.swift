//
//  PokemonTests.swift
//  TestCodeExampleTests
//
//  Created by 박진수 on 2020/06/03.
//  Copyright © 2020 박진수. All rights reserved.
//

import XCTest
@testable import TestCodeExample

class PokemonTests: XCTestCase {
    
    var squirtle: Pokemon!
    var charmander: Pokemon!
    var psyduck: Pokemon!

    override func setUpWithError() throws {
        super.setUp()
        squirtle = Pokemon(type: .water)
        charmander = Pokemon(type: .fire)
        psyduck = Pokemon(type: .water)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        super.tearDown()
        squirtle = nil
        charmander = nil
        psyduck = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_calculatePokemonDamage() {
        // 1.
        squirtle.attack(enemy: charmander)
        squirtle.attack(enemy: psyduck)
        
        XCTAssertTrue(charmander.health < psyduck.health)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
