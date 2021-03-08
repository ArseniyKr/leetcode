import UIKit

// 1480. Running Sum of 1d Array
//
// Given an array nums.
// We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
//
// Return the running sum of nums.

func runningSum(_ nums: [Int]) -> [Int] {
    //(0..<nums.count).map { nums[0...$0].reduce(0, +) }
    var result = [nums[0]]
    for i in 1..<nums.count {
        result.append(result[i-1] + nums[i])
    }
    return result
}

runningSum([1,2,3,4]) == [1,3,6,10]
runningSum([1,1,1,1,1]) == [1,2,3,4,5]
runningSum([3,1,2,10,1]) == [3,4,6,16,17]
