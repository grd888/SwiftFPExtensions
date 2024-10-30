//
//  ForwardComposeTests.swift
//  SwiftFPExtensions
//
//  Created by Greg Delgado on 10/30/24.
//

import XCTest
import SwiftFPExtensions

class ForwardComposeTests: XCTestCase {
    
    func testIntToStringComposition() {
        // Given
        let double = { (x: Int) in x * 2 }
        let toString = { (x: Int) in String(x) }
        
        // When
        let doubleToString = double >>> toString
        
        // Then
        XCTAssertEqual(doubleToString(4), "8")
        XCTAssertEqual(doubleToString(0), "0")
        XCTAssertEqual(doubleToString(-3), "-6")
    }
    
    func testStringToBoolComposition() {
        // Given
        let toUppercase = { (str: String) in str.uppercased() }
        let isUppercase = { (str: String) in str == str.uppercased() }
        
        // When
        let upperAndCheck = toUppercase >>> isUppercase
        
        // Then
        XCTAssertTrue(upperAndCheck("hello"))  // Should return true after uppercase
        XCTAssertTrue(upperAndCheck("HELLO"))  // Already uppercase
        XCTAssertTrue(upperAndCheck("Hello")) // Mixed case becomes uppercase
    }
    
    func testIntToIntComposition() {
        // Given
        let addFive = { (x: Int) in x + 5 }
        let square = { (x: Int) in x * x }
        
        // When
        let addThenSquare = addFive >>> square
        
        // Then
        XCTAssertEqual(addThenSquare(3), 64)   // (3 + 5)^2 = 64
        XCTAssertEqual(addThenSquare(-5), 0)   // (-5 + 5)^2 = 0
        XCTAssertEqual(addThenSquare(0), 25)   // (0 + 5)^2 = 25
    }
    
    func testEmptyStringToStringComposition() {
        // Given
        let trim = { (str: String) in str.trimmingCharacters(in: .whitespaces) }
        let reverse = { (str: String) in String(str.reversed()) }
        
        // When
        let trimAndReverse = trim >>> reverse
        
        // Then
        XCTAssertEqual(trimAndReverse(" hello "), "olleh")  // " hello " trimmed and reversed
        XCTAssertEqual(trimAndReverse("world"), "dlrow")    // "world" reversed
        XCTAssertEqual(trimAndReverse("  "), "")            // Empty after trimming
    }
    
    func testIdentityFunctionComposition() {
        // Given
        let identity = { (x: Int) in x }
        let addTen = { (x: Int) in x + 10 }
        
        // When
        let identityThenAdd = identity >>> addTen
        
        // Then
        XCTAssertEqual(identityThenAdd(5), 15)      // 5 + 10 = 15
        XCTAssertEqual(identityThenAdd(0), 10)      // 0 + 10 = 10
        XCTAssertEqual(identityThenAdd(-10), 0)     // -10 + 10 = 0
    }
}
