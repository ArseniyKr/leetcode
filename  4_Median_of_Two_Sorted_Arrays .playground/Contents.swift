
/*
 4. Median of Two Sorted Arrays

 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 You may assume nums1 and nums2 cannot be both empty.
 */


import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let array = (nums1 + nums2).sorted()
    let count = array.count
    if count % 2 == 1 {
        let index = count / 2
        return Double(array[index])
    } else {
        let second = count / 2
        let first = second - 1
        let sum = array[first] + array[second]
        return Double(sum) / 2
    }
}
