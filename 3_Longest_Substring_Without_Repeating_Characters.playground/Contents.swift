
/*
 3. Longest Substring Without Repeating Characters
 
 Given a string, find the length of the longest substring without repeating characters
 */

import Foundation

class Solution {

    func lengthOfLongestSubstring(_ s: String) -> Int {
       if s.isEmpty { return 0 } else if s.count == 1 { return 1 }
       let array = Array(s)
       var length = 1
       var temp = 0
       let last = array.count - 1
       for i in 1...last {
           let symbol = array[i]
           let slice = array[temp..<i]
           if length < slice.count { length = slice.count }
           if let index = slice.firstIndex(of: symbol) {
               temp = index + 1
           } else if i == last { length = max(array[temp...i].count, length) }
       }
       return length
    }
}
