//
//  PipeForwardOperatorTests.swift
//  SwiftFPExtensions
//
//  Created by Greg Delgado on 10/30/24.
//

import XCTest
import SwiftFPExtensions

class PipeForwardOperatorTests: XCTestCase {

    func testSingleTransformation() {
        // Test applying a single function to an integer
        func increment(_ x: Int) -> Int { x + 1 }
        
        let result = 5 |> increment
        XCTAssertEqual(result, 6, "Pipe operator should correctly apply the function to increment the value.")
    }
    
    func testMultipleTransformations() {
        // Test applying multiple functions in a chain
        func double(_ x: Int) -> Int { x * 2 }
        func subtractThree(_ x: Int) -> Int { x - 3 }
        
        let result = 10 |> double |> subtractThree
        XCTAssertEqual(result, 17, "Pipe operator should correctly apply multiple functions in sequence.")
    }

    func testStringTransformation() {
        // Test transformations on a string
        func addExclamation(_ s: String) -> String { s + "!" }
        func toUpperCase(_ s: String) -> String { s.uppercased() }
        
        let result = "hello" |> addExclamation |> toUpperCase
        XCTAssertEqual(result, "HELLO!", "Pipe operator should correctly apply string transformations.")
    }
    
    func testComplexTypeTransformation() {
        // Test transformations on a custom struct
        struct Point {
            var x: Int
            var y: Int
        }
        
        func moveRight(_ point: Point) -> Point {
            return Point(x: point.x + 1, y: point.y)
        }
        
        func moveUp(_ point: Point) -> Point {
            return Point(x: point.x, y: point.y + 1)
        }
        
        let startPoint = Point(x: 0, y: 0)
        let result = startPoint |> moveRight |> moveUp
        XCTAssertEqual(result.x, 1, "Pipe operator should correctly update the x coordinate.")
        XCTAssertEqual(result.y, 1, "Pipe operator should correctly update the y coordinate.")
    }
}
