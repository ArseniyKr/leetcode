
/*
 3. Longest Substring Without Repeating Characters
 
 Given a string, find the length of the longest substring without repeating characters
 */

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var (maximum, temp) = (1, "")
        for symbol in s {
            if temp.contains(symbol) {
                maximum = max(temp.count, maximum)
                if let last = temp.components(separatedBy: String(symbol)).last { temp = last }
            }
            temp.append(symbol)
        }
        return max(temp.count, maximum)
    }
}
