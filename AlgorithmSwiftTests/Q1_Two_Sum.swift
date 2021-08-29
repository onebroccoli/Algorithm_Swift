//
//  Q1_Two_Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/13/21.
//


/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
  

 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.
  

 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?

 */
import XCTest

private class Solution{
    //method1: hashmap
    func twoSum(_ nums: [Int], _ target: Int) -> [Int]{
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated(){
            if let tempIndex = dict[target - num]{
                return [tempIndex, i]
            }
            dict[num] = i
        }
        return []
    }
}



class Q1_Two_Sum: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }



}
