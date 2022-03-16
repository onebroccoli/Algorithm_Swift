//
//  Q268_Missing_Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/11/21.
//
/*
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

 Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?

  

 Example 1:

 Input: nums = [3,0,1]
 Output: 2
 Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
 Example 2:

 Input: nums = [0,1]
 Output: 2
 Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
 Example 3:

 Input: nums = [9,6,4,2,3,5,7,0,1]
 Output: 8
 Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
 Example 4:

 Input: nums = [0]
 Output: 1
 Explanation: n = 1 since there is 1 number, so all numbers are in the range [0,1]. 1 is the missing number in the range since it does not appear in nums.
  

 Constraints:

 n == nums.length
 1 <= n <= 104
 0 <= nums[i] <= n
 All the numbers of nums are unique.

 */
import XCTest
private class Solution {
//    func missingNumber(_ nums: [Int]) -> Int {
//        let n = nums.count
//        var sum = (1+n) * n / 2
//        for n in nums {
//            sum -= n
//        }
//        return sum
//    }
    
    //有问题还没修好
//    func missingNumber(_ nums: [Int]) -> Int {
//        var temp = Array(repeating: false, count: nums.count)
//        for i in nums {
//            temp[i] = true
//        }
//        for j in 0..<temp.count {
//            if temp[j] == false {
//                return j
//            }
//        }
//        return nums.count
//    }
    
    
}


class Q268_Missing_Number: XCTestCase {

  

//    func testExample() throws {
//        let s = Solution()
//        let r = s.missingNumber([0,1,3])
//        print(r)
//    }

}
