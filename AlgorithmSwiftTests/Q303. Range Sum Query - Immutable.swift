//
//  Q303. Range Sum Query - Immutable.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/22/22.
//
/*
 303. Range Sum Query - Immutable
 Given an integer array nums, handle multiple queries of the following type:

 Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
 Implement the NumArray class:

 NumArray(int[] nums) Initializes the object with the integer array nums.
 int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
  

 Example 1:

 Input
 ["NumArray", "sumRange", "sumRange", "sumRange"]
 [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
 Output
 [null, 1, -1, -3]

 Explanation
 NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
 numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
 numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
 numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3
  

 Constraints:

 1 <= nums.length <= 104
 -105 <= nums[i] <= 105
 0 <= left <= right < nums.length
 At most 104 calls will be made to sumRange.
 */
import XCTest
private class Solution {
    var sum = [Int]()
    init(_ nums: [Int]) {
        if nums.count == 0 {return}
        sum = Array(repeating: 0, count: nums.count + 1)
        for i in 0..<nums.count {
            sum[i + 1] = sum[i] + nums[i]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        print("sum = ", sum)
        print("right = ",sum[right])
        print("left = ",sum[left])

        return sum[right + 1] - sum[left]
    }
}
class Q303__Range_Sum_Query___Immutable: XCTestCase {

   

    func testExample() throws {
        let a: [Int] = [-2,0,3,-5,2,-1]
        let s = Solution(a)
        let res = s.sumRange(0, 2)
        print("result: ===  ", res)
        
    }

   

}
