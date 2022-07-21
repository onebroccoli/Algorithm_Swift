//
//  Q1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/20/22.
//
/*
 1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
 Given an array of integers nums and an integer limit, return the size of the longest non-empty subarray such that the absolute difference between any two elements of this subarray is less than or equal to limit.

  

 Example 1:

 Input: nums = [8,2,4,7], limit = 4
 Output: 2
 Explanation: All subarrays are:
 [8] with maximum absolute diff |8-8| = 0 <= 4.
 [8,2] with maximum absolute diff |8-2| = 6 > 4.
 [8,2,4] with maximum absolute diff |8-2| = 6 > 4.
 [8,2,4,7] with maximum absolute diff |8-2| = 6 > 4.
 [2] with maximum absolute diff |2-2| = 0 <= 4.
 [2,4] with maximum absolute diff |2-4| = 2 <= 4.
 [2,4,7] with maximum absolute diff |2-7| = 5 > 4.
 [4] with maximum absolute diff |4-4| = 0 <= 4.
 [4,7] with maximum absolute diff |4-7| = 3 <= 4.
 [7] with maximum absolute diff |7-7| = 0 <= 4.
 Therefore, the size of the longest subarray is 2.
 Example 2:

 Input: nums = [10,1,2,4,7,2], limit = 5
 Output: 4
 Explanation: The subarray [2,4,7,2] is the longest since the maximum absolute diff is |2-7| = 5 <= 5.
 Example 3:

 Input: nums = [4,2,2,2,4,4,2,2], limit = 0
 Output: 3
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 109
 0 <= limit <= 109
 */
import XCTest
private class Solution {
    //Solution1: O(N^3)  exceed time limit
    func longestSubarray_bruteforce1(_ nums: [Int], _ limit: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var maxLen = 1
        for i in 0..<nums.count {
            for j in i..<nums.count {
                let diff = abs(nums[i...j].max()! - nums[i...j].min()!)
                if diff <= limit {
                    maxLen = max(maxLen, j - i + 1)
                    
                }
            }
        }
        return maxLen
    }
    
    //optimize brute force O(N^2) exceed time limit
    func longestSubarray_bruteforce2(_ nums: [Int], _ limit: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var maxLen = 1
        for i in 0..<nums.count {
            var minValue = Int.max
            var maxValue = Int.min
            for j in i..<nums.count {
                //                let diff = abs(nums[i...j].max()! - nums[i...j].min()!)
                minValue = min(nums[j], minValue)
                maxValue = max(nums[j], maxValue)
                let diff = abs(maxValue - minValue)
                if diff <= limit {
                    maxLen = max(maxLen, j - i + 1)
                    
                }
            }
        }
        return maxLen
    }
    
    //working: sliding window O(N)
    //// Source: https://tinyurl.com/y3h2fj2m
    
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var (left, right, maxLen) = (0, 0, 1)
        var (minDeque, maxDeque) = ([Int](), [Int]())
        while right < nums.count {
            while let last = minDeque.last, nums[last] >= nums[right] {
                minDeque.removeLast()
            }
            while let last = maxDeque.last, nums[last] <= nums[right] {
                maxDeque.removeLast()
            }
            minDeque.append(right)
            maxDeque.append(right)
            
            while nums[maxDeque.first!] - nums[minDeque.first!] > limit {
                left += 1
                if left > minDeque.first! {
                    minDeque.removeFirst()
                }
                if left > maxDeque.first! {
                    maxDeque.removeFirst()
                }
            }
            maxLen = max(maxLen, right - left + 1)
            right += 1
        }
        return maxLen
    }
    
    
}
class Q1438__Longest_Continuous_Subarray_With_Absolute_Diff_Less_Than_or_Equal_to_Limit: XCTestCase {

   
    func testExample() throws {
       let s = Solution()
        let a = [8,2,4,7]
        let result = s.longestSubarray_bruteforce(a, 4)
        print("result ==== : ", result)
    }

}
