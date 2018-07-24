//
//  UnitTests.swift
//  Swift LabsTests
//
//  Created by Jonathan Lehr on 7/21/18.
//  Copyright © 2018 About Objects. All rights reserved.
//

import XCTest
@testable import Swift_Labs


func somethingIWantToTest() {
    print("In " + #function)
}


extension UnitTests
{
    func testOptionalStuff() {
        switch (firstName, lastName) {
        case (nil, let last?):        print(last)
        case (let first?, nil):       print(first)
        case (let first?, let last?): print("\(last), \(first)")
        default:                      print("No name")
        }
    }
}

class UnitTests: XCTestCase
{
    let firstName: String? = nil
    let lastName: String? = "Smith"

    override func setUp() { super.setUp(); print() }
    override func tearDown() { print(); super.tearDown() }
    
    func testFahrenheitToCelsius() {
        print("In " + #function)
        // TODO: Call the conversion function to get the actual value.
        let actual = 0.0
        XCTAssertEqual(actual, 0.0)
    }
    
    func testSomeOtherStuff() {
        print("In " + #function)
    }
    
    func testSomethingIWantToTest() {
        somethingIWantToTest()
    }
}
