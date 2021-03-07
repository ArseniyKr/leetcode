import Foundation

// 1512. Number of Good Pairs
//
// Given an array of integers nums.
// A pair (i,j) is called good if nums[i] == nums[j] and i < j.
// Return the number of good pairs.

func numIdenticalPairs(_ nums: [Int])  -> Int {
    if nums.count < 2 { return 0 }
    var result = 0
    var first = 0
    let last = nums.count - 1
    while first < last {
        for i in (first + 1)...last {
            if nums[first] == nums[i] { result += 1 }
        }
        first += 1
    }
    return result
}
