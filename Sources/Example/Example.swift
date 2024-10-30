//
//  File.swift
//  SwiftFPExtensions
//
//  Created by Greg Delgado on 10/30/24.
//

import Foundation

// Sample
func incr(_ x: Int) -> Int {
    return x + 1
}

func square(_ x: Int) -> Int {
    x * x
}

func run() {
    let result = 2 |> incr |> square
    print(result)
}
