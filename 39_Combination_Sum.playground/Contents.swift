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

class Solution {

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combination = [Int]()
        var results = [[Int]]()
        findCombinationsToTarget(results: &results, combination: &combination, candidates: candidates.sorted(), target: target, index: 0)

        return results
    }

    func findCombinationsToTarget(results: inout [[Int]], combination: inout [Int], candidates: [Int], target: Int, index: Int) {
        if target == 0 { results.append(combination); return }

        for i in index..<candidates.count {
            if candidates[i] > target { continue }
            combination.append(candidates[i])
            findCombinationsToTarget(results: &results, combination: &combination, candidates: candidates, target: target - candidates[i], index: i)
            combination.removeLast()
        }
    }
}

