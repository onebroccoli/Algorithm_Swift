//
//  Q2104. Sum of Subarray Ranges.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/21/22.
//
/*
 2104. Sum of Subarray Ranges
 You are given an integer array nums. The range of a subarray of nums is the difference between the largest and smallest element in the subarray.

 Return the sum of all subarray ranges of nums.

 A subarray is a contiguous non-empty sequence of elements within an array.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: 4
 Explanation: The 6 subarrays of nums are the following:
 [1], range = largest - smallest = 1 - 1 = 0
 [2], range = 2 - 2 = 0
 [3], range = 3 - 3 = 0
 [1,2], range = 2 - 1 = 1
 [2,3], range = 3 - 2 = 1
 [1,2,3], range = 3 - 1 = 2
 So the sum of all ranges is 0 + 0 + 0 + 1 + 1 + 2 = 4.
 Example 2:

 Input: nums = [1,3,3]
 Output: 4
 Explanation: The 6 subarrays of nums are the following:
 [1], range = largest - smallest = 1 - 1 = 0
 [3], range = 3 - 3 = 0
 [3], range = 3 - 3 = 0
 [1,3], range = 3 - 1 = 2
 [3,3], range = 3 - 3 = 0
 [1,3,3], range = 3 - 1 = 2
 So the sum of all ranges is 0 + 0 + 0 + 2 + 0 + 2 = 4.
 Example 3:

 Input: nums = [4,-2,-3,4,1]
 Output: 59
 Explanation: The sum of all subarray ranges of nums is 59.
  

 Constraints:

 1 <= nums.length <= 1000
 -109 <= nums[i] <= 109
  

 Follow-up: Could you find a solution with O(n) time complexity?
 */
import XCTest
private class Solution {
func subArrayRanges(_ nums: [Int]) -> Int {
    var res = 0
    let n = nums.count
    var j = 0
    var k = 0
    var stack = [Int]()
    for i in 0...n {
        while let last = stack.last, nums[last] > (i == n ? Int.min : nums[i]) {
            j = stack.removeLast()
            k = stack.last ?? -1
            res -= nums[j] * (i - j) * (j - k)
        }
        stack.append(i)
    }
    stack.removeAll()
    for i in 0...n {
        while let last = stack.last, nums[last] < (i == n ? Int.max : nums[i]){
            j = stack.removeLast()
            k = stack.last ?? -1
            res += nums[j] * (i-j)*(j-k)
        }
        stack.append(i)
    }
    return res
}
}
class Q2104__Sum_of_Subarray_Ranges: XCTestCase {

   
    func testExample() throws {
        let s = Solution()
        let a = [1,2,3]
        let res = s.subArrayRanges(a)
        print("result:   ", res)
    }

 
}
