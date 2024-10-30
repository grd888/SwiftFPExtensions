//
//  FishOperator.swift
//  SwiftFPExtensions
//
//  Created by Greg Delgado on 10/30/24.
//

import Foundation

precedencegroup EffectfulComposition {
    associativity : left
    higherThan: ForwardApplication
}

infix operator >=>: EffectfulComposition

/// Composes two functions that produce values and logs, combining their results and logs in sequence.
///
/// The custom operator `>=>` represents effectful composition, allowing you to chain functions that produce both a result and an array of log messages.
/// Given two functions `f` and `g`, where `f` maps a value of type `A` to a tuple containing a result of type `B` and log messages, and `g` maps a value of type `B` to a result of type `C` and more log messages, this operator returns a new function that maps `A` to `C` while combining the log messages from `f` and `g`.
///
/// - Parameters:
///   - f: A function that takes a value of type `A` and returns a tuple containing a result of type `B` and an array of log messages.
///   - g: A function that takes a value of type `B` and returns a tuple containing a result of type `C` and an array of log messages.
/// - Returns: A new function that takes a value of type `A` and returns a tuple containing a result of type `C` and the combined log messages.
///
/// ### Example
/// ```swift
/// func step1(_ input: Int) -> (Double, [String]) {
///     return (Double(input) * 2.0, ["Converted Int to Double and doubled it."])
/// }
///
/// func step2(_ input: Double) -> (String, [String]) {
///     return ("Result is \(input)", ["Converted Double to String."])
/// }
///
/// let composedFunction = step1 >=> step2
/// let result = composedFunction(3)
/// // result is ("Result is 6.0", ["Converted Int to Double and doubled it.", "Converted Double to String."])
/// ```
///
/// ### Discussion
/// This operator facilitates function chaining where each step produces both a result and log messages. This can be particularly useful for tracking intermediate values and debugging.
///
/// - Note: `EffectfulComposition` is a custom precedence group with left associativity, making this operator higher precedence than `ForwardApplication`.
public func >=> <A, B, C>(
    _ f: @escaping (A) -> (B, [String]),
    _ g: @escaping (B) -> (C, [String])
) -> (A) -> (C, [String]) {
    return { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}
