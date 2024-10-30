//
//  FishOperatorTests.swift
//  SwiftFPExtensions
//
//  Created by Greg Delgado on 10/30/24.
//

import XCTest
import SwiftFPExtensions

class EffectfulCompositionTests: XCTestCase {
    
    // Sample function 1: Takes an Int, returns a Double and a log message
    func convertToDoubleAndDouble(_ input: Int) -> (Double, [String]) {
        return (Double(input) * 2.0, ["Converted Int to Double and doubled it."])
    }

    // Sample function 2: Takes a Double, returns a String and a log message
    func convertToString(_ input: Double) -> (String, [String]) {
        return ("Result is \(input)", ["Converted Double to String."])
    }

    // Test composed function with a valid input
    func testEffectfulCompositionWithValidInput() {
        let composedFunction = convertToDoubleAndDouble >=> convertToString
        let (result, logs) = composedFunction(5)
        
        XCTAssertEqual(result, "Result is 10.0", "Resulting string is incorrect.")
        XCTAssertEqual(logs, ["Converted Int to Double and doubled it.", "Converted Double to String."], "Log messages do not match expected output.")
    }

    // Test composed function with edge case input
    func testEffectfulCompositionWithZero() {
        let composedFunction = convertToDoubleAndDouble >=> convertToString
        let (result, logs) = composedFunction(0)
        
        XCTAssertEqual(result, "Result is 0.0", "Resulting string is incorrect for input 0.")
        XCTAssertEqual(logs, ["Converted Int to Double and doubled it.", "Converted Double to String."], "Log messages do not match expected output for input 0.")
    }

    // Test composed function with negative input
    func testEffectfulCompositionWithNegativeInput() {
        let composedFunction = convertToDoubleAndDouble >=> convertToString
        let (result, logs) = composedFunction(-3)
        
        XCTAssertEqual(result, "Result is -6.0", "Resulting string is incorrect for negative input.")
        XCTAssertEqual(logs, ["Converted Int to Double and doubled it.", "Converted Double to String."], "Log messages do not match expected output for negative input.")
    }

    // Test with functions that produce no logs
    func testEffectfulCompositionWithNoLogs() {
        func noLogFunction1(_ input: Int) -> (Int, [String]) {
            return (input + 1, [])
        }
        
        func noLogFunction2(_ input: Int) -> (Int, [String]) {
            return (input * 2, [])
        }
        
        let composedFunction = noLogFunction1 >=> noLogFunction2
        let (result, logs) = composedFunction(3)
        
        XCTAssertEqual(result, 8, "Result should be 8 (3 + 1, then * 2).")
        XCTAssertEqual(logs, [], "Logs should be empty when both functions produce no logs.")
    }

    // Test with functions that only produce logs
    func testEffectfulCompositionWithOnlyLogs() {
        func logOnlyFunction1(_ input: Int) -> (Int, [String]) {
            return (input, ["First function log only"])
        }
        
        func logOnlyFunction2(_ input: Int) -> (Int, [String]) {
            return (input, ["Second function log only"])
        }
        
        let composedFunction = logOnlyFunction1 >=> logOnlyFunction2
        let (result, logs) = composedFunction(10)
        
        XCTAssertEqual(result, 10, "Result should remain 10 as no computation occurs.")
        XCTAssertEqual(logs, ["First function log only", "Second function log only"], "Logs should combine correctly from both functions.")
    }
}
