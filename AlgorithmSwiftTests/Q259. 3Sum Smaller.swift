//
//  Q259. 3Sum Smaller.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/18/22.
//
/*
 259. 3Sum Smaller
 Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

  

 Example 1:

 Input: nums = [-2,0,1,3], target = 2
 Output: 2
 Explanation: Because there are two triplets which sums are less than 2:
 [-2,0,1]
 [-2,0,3]
 Example 2:

 Input: nums = [], target = 0
 Output: 0
 Example 3:

 Input: nums = [0], target = 0
 Output: 0

 */
import XCTest
private class Solution {
func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 || nums == nil {
        return 0
    }
    
    var result = 0
    var nums = nums
    for i in 0..<nums.count - 2 {
        var left = i + 1
        var right = nums.count - 1
        
        while left < right {
            var s = nums[i] + nums[left] + nums[right]
            if s < target {
                if s < target {
                    result += right - left
                    left += 1
                }
                else {
                    right -= 1
                }
            }
            return result
        }
        
        
    }
    return result
    
}
}
class Q259__3Sum_Smaller: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        let a = [-2,0, 1 , 3]
        let res = s.threeSumSmaller(a, 2)
        print ("result:", res)
    }

    

}
