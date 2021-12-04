//
//  Q152_Maximum_Product_Subarray.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/2/21.
//
/*
 
 152. Maximum Product Subarray
 Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

 It is guaranteed that the answer will fit in a 32-bit integer.

 A subarray is a contiguous subsequence of the array.

  

 Example 1:

 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:

 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
  

 Constraints:
 
 */
import XCTest
private class Solution {
func maxProduct(_ nums: [Int]) -> Int {
    var result = nums[0]
    var cur_max = nums[0]
    var cur_min = nums[0]
    
    for i in 1..<nums.count {
        var temp_max = max(nums[i], max(cur_max * nums[i], cur_min * nums[i]))
        cur_min = min(nums[i], min(cur_min * nums[i], cur_max * nums[i]))
        cur_max = temp_max
        
        
        
        result = max(result, cur_max)
    }
    return result
}
    
}
class Q152_Maximum_Product_Subarray: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
