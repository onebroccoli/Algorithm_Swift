//
//  Q53_Maximum_Subarray.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/2/21.
//
/*
 53. Maximum Subarray
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 A subarray is a contiguous part of an array.

  

 Example 1:

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Example 2:

 Input: nums = [1]
 Output: 1
 Example 3:

 Input: nums = [5,4,-1,7,8]
 Output: 23
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
  

 Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */
import XCTest
private class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //assumption: array!= nil && array.count >= 1
        //the subarray must contain at least one element
        var result = nums[0]
        var cur = nums[0]
        //dp[i] means the largest sum of subarray ending at index i
        //dp[i] = array[i]  if dp[i - 1] <= 0;
        //dp[i] = dp[i - 1] + array[i] if dp[i - 1] > 0
        //reduce the space consumption by recording the latest largest sum
        for i in 1..<nums.count {
            cur = max(cur + nums[i], nums[i])
            result = max(result, cur)
        }
        return result
                
    }
}


class Q53_Maximum_Subarray: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let a = [2,-1,4,-2,1]
        var result = s.maxSubArray(a)
        print("result: =====", result)
    }


}
