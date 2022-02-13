//
//  L_Longest_subarray_contains_only_1s.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/1/21.
//
/*
 L625. Longest subarray contains only 1s
 Given an array of integers that contains only 0s and 1s and a positive integer k, you can flip at most k 0s to 1s, return the longest subarray that contains only integer 1 after flipping.

 Assumptions:

 1. Length of given array is between [1, 20000].

 2. The given array only contains 1s and 0s.

 3. 0 <= k <= length of given array.

 Example 1:

 Input: array = [1,1,0,0,1,1,1,0,0,0], k = 2

 Output: 7

 Explanation: flip 0s at index 2 and 3, then the array becomes [1,1,1,1,1,1,1,0,0,0], so that the length of longest subarray that contains only integer 1 is 7.

 Example 2:

 Input: array = [1,1,0,0,1,1,1,0,0,0], k = 0

 Output: 3

 Explanation: k is 0 so you can not flip any 0 to 1, then the length of longest subarray that contains only integer 1 is 3.
 */
//import XCTest
//private class Solution {
//func longestConsecutiveOnes(_ nums: [Int], _ k: Int) -> Int {
//    var slow = 0
//    var fast = 0
//    var count = 0
//    var longest = 0
//    while fast < nums.count {
//        if nums[fast] == 1 {
//            fast += 1
//            longest = max(longest, fast - slow)
//            continue
//        }
//        if count < k {
//            count += 1
//            fast += 1
//            longest = max(longest, fast - slow)
//            continue
//        }
//        if nums[slow] == 0 {
//            count -= 1
//        }
//        slow += 1
//    }
//    return longest
//}
//
//}
//class L_Longest_subarray_contains_only_1s: XCTestCase {
//
//
//
//    func testExample() throws {
//        let s = Solution()
//        let a1 = [1,1,0,0,1,1,1,0,0,0]
//        let k = 2
//        var result = s.longestConsecutiveOnes(a1, k)
//        print("result1: =====", result)
//    }
//
//
//
//}
