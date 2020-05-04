/*
 39. Combination Sum
 
Given a set of candidate numbers (candidates) (without duplicates) and a target number (target),
find all unique combinations in candidates where the candidate numbers sums to target.

The same repeated number may be chosen from candidates unlimited number of times.

Note:

All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
*/

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {

    let numbers = candidates.sorted(by: >)
    let templates = matrix(for: numbers.map({ target / $0 }))
    var variants = Array<[Int]>()
    for row in templates {
        var variant = [Int]()
        for index in 0..<row.count {
            variant.append(contentsOf: Array(repeating: numbers[index], count: row[index]))
        }
        if variant.reduce(0, { $0 + $1 }) == target { variants.append(variant) }
    }
    return variants
}

func matrix(for array: [Int]) -> [[Int]] {
    guard let first = array.first else { return [] }
    let croppedArray = Array(array.dropFirst())
    if croppedArray.isEmpty {
        return (0...first).map { [$0] }
    } else {
        return matrix(for: croppedArray)
                .map {  combination in (0...first).map { [$0] + combination }  }
                .reduce(into: Array<[Int]>()) { $0.append(contentsOf: $1) }
    }
}

