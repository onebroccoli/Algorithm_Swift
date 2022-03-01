//
//  Q560. Subarray Sum Equals K.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/25/22.
//
/*
 560. Subarray Sum Equals K
 Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.

  

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107
 */
import XCTest
private class Solution {
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    var sum = 0
    var map =  [Int : Int]()
    map[0] = 1
    for i in 0..<nums.count {
        sum += nums[i]
        if map.keys.contains(sum - k) {
            count += map[sum - k]!
            
        }
        map[sum, default: 0] += 1
    }
    return count
}
}
class Q560__Subarray_Sum_Equals_K: XCTestCase {


    func testExample() throws {
       let s = Solution()
        let a = [1, 1, 1]
        let result = s.subarraySum(a, 2)
        print("result: === ", result)
        
    }



}
