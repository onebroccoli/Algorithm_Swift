//
//  Q523. Continuous Subarray Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/10/22.
//
/*
 523. Continuous Subarray Sum

 Given an integer array nums and an integer k, return true if nums has a continuous subarray of size at least two whose elements sum up to a multiple of k, or false otherwise.

 An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.

  

 Example 1:

 Input: nums = [23,2,4,6,7], k = 6
 Output: true
 Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 Example 2:

 Input: nums = [23,2,6,4,7], k = 6
 Output: true
 Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
 42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.
 Example 3:

 Input: nums = [23,2,6,4,7], k = 13
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 0 <= sum(nums[i]) <= 231 - 1
 1 <= k <= 231 - 1
 */
import XCTest
private class Solution {
//func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
//    if nums.count == 1 {
//        return false
//    }
//
//    var prefixSum = nums[0]
//
//    var start = 0
//    var dict = [ nums[0] % k: 0]
//
//    for i in 1..<nums.count {
//        prefixSum += nums[i]
//        let remainder = prefixSum % k
//
//        if remainder == 0 {
//            return true
//            //if remainder exists in dictionary, means prefix has the remainder before, and the subarrry is a multiply of k
//        } else if let secondIndex = dict[remainder] {
//            if abs(i - secondIndex) >= 2 { return true } //compare the index if the gap is >=2 elements, its true
//        } else {
//            dict[remainder] = i
//        }
//    }
//
//    return false
//}
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: Int]()
        dict[0] = -1
        var sum = 0
        for (index, value) in nums.enumerated() {
            sum += value
            if k != 0 {
                sum  %= k
            }
            if let prev = dict[sum]{
                //check subarray of at lest size 2
                if index - prev > 1 {
                    return true
                }
            }else {
                dict[sum] = index
            }
        }
        return false
    }
    
    
    
}
class Q523__Continuous_Subarray_Sum: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let a = [23,2,4,6,7]
        let k = 6
        let result = s.checkSubarraySum(a, k)
        print("RESULT === : ", result)
    }

   

}
