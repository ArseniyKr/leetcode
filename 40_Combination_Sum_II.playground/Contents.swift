
/*
40. Combination Sum II

Given a collection of candidate numbers (candidates) and a target number (target),
find all unique combinations in candidates where the candidate numbers sums to target.

Each number in candidates may only be used once in the combination.

Note:

All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
*/

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let set = NSCountedSet(array: candidates.filter({ $0 <= target }))
    guard let array = Array(set) as? [Int] else { return [] }
    let templates = matrix(for: array.map({ set.count(for: $0) }))

    var variants = Array<[Int]>()
    for template in templates {
        var variant = [Int]()
        for index in 0..<template.count {
            variant.append(contentsOf: Array(repeating: array[index], count: template[index]))
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
