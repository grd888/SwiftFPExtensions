import XCTest
import SwiftFPExtensions

final class SwiftFPExtensionsTests: XCTestCase {
    func test_incr_zero() throws {
        XCTAssertEqual(incr(0), 1)
    }
    
    func test_incr_negative_number() throws {
        XCTAssertEqual(incr(-1), 0)
    }
    
    func test_square_zero() throws {
        XCTAssertEqual(square(0), 0)
    }
    
    func test_square_negative() throws {
        XCTAssertEqual(square(-3), 9)
    }
    
    func test_square_positive() throws {
        XCTAssertEqual(square(3), 9)
    }
    
    func incr(_ x: Int) -> Int {
        return x + 1
    }

    func square(_ x: Int) -> Int {
        x * x
    }
}
