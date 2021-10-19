//
//  Q704_Binary_Search.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/25/21.
//

import XCTest

/*
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:

 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 Example 2:

 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1

 */
private class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums == nil || nums.count == 0 {
            return -1
        }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}


class Q704_Binary_Search: XCTestCase {


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
