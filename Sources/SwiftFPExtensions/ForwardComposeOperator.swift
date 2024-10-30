//
//  ForwardCompose.swift
//  SwiftFPExtensions
//
//  Created by Greg Delgado on 10/30/24.
//

import Foundation

precedencegroup ForwardComposition {
    associativity: left
    higherThan : ForwardApplication
}

infix operator >>>: ForwardComposition

/// The ForwardCompose operator  >>>
///
/// Combines two functions into a single function by chaining their outputs.
///
/// This infix operator (`>>>`) takes two functions, `f` and `g`, and returns a new function that
/// applies `f` to an input value of type `A` and then applies `g` to the result of `f`,
/// producing an output of type `C`.
///
/// - Parameters:
///   - f: A function that takes an input of type `A` and produces an output of type `B`.
///   - g: A function that takes an input of type `B` and produces an output of type `C`.
/// - Returns: A new function that takes an input of type `A`, applies `f` to it, then applies `g`
///   to the result of `f`, producing an output of type `C`.
///
/// - Example:
///   ```swift
///   let double = { (x: Int) in x * 2 }
///   let toString = { (x: Int) in String(x) }
///   let doubleToString = double >>> toString
///   print(doubleToString(4)) // Prints "8"
///   ```
public func >>> <A, B, C>(
    f: @escaping (A) -> B, g: @escaping (B) -> C
) -> (A) -> C {
    return { a in
        g(f(a))
    }
}
