//
//  Q209_Minimum_Size_Subarray_Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/27/22.
//
/*
 209. Minimum Size Subarray Sum
 Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.

  

 Example 1:

 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 Example 2:

 Input: target = 4, nums = [1,4,4]
 Output: 1
 Example 3:

 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
  

 Constraints:

 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 105
  

 Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
 */
import XCTest
private class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        if nums == nil || nums.count == 0 {
            return 0
        }
        var sums = [Int](repeatElement(0, count: nums.count + 1))
        var result = Int.max
        
        for i in 1..<sums.count {
            sums[i] = sums[i - 1] + nums[i - 1]
            
        }
        for i in 0..<sums.count {
            let end = binarySearch(i + 1, sums.count - 1, sums, sums[i] + target)
            if end == sums.count {
                break
                
            }
            if end - i < result {
                result = end - i
            }
        }
        return result == Int.max ? 0 : result
    }
    
    func binarySearch(_ left: Int, _ right: Int, _ nums: [Int], _ target: Int) -> Int {
        var left = left
        var right = right
        var mid = 0
        
        while left <= right {
            mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
}
class Q209_Minimum_Size_Subarray_Sum: XCTestCase {
    

    func testExample() throws {
        let s = Solution()
        var a = [2,3,1,2,4,3]
        var result = s.minSubArrayLen( 7,a)
        print("result = : ",result)
    }


}
