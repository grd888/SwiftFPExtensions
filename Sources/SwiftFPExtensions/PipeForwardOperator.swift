precedencegroup ForwardApplication {
    associativity: left
}
infix operator |>: ForwardApplication

/// The PipeForward operator |>
///
/// Applies a function to a value in a forward-pipe style.
///
/// The `|>` operator allows for chaining function applications in a more readable manner, similar to functional programming languages.
/// It takes a value on the left and a function on the right, passing the value as the function's argument and returning the function's result.
///
/// - Parameters:
///   - a: The initial value to pass to the function.
///   - f: A function that takes a value of type `T` and returns a value of type `U`.
/// - Returns: The result of applying the function `f` to the value `a`.
///
/// # Example Usage:
/// ```swift
/// func square(_ x: Int) -> Int { return x * x }
/// func addThree(_ x: Int) -> Int { return x + 3 }
///
/// let result = 5 |> square |> addThree
/// print(result) // Output: 28
/// ```
///
/// # Discussion
/// This operator is commonly used for creating a fluent syntax when applying multiple transformations to a value in sequence.
public func |> <T, U>(a: T, f: (T) -> U) -> U {
    return f(a)
}
