//
//  259. 3Sum Smaller 259.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/19/21.
//

/*
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

private class Solution{
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int{
        let nums = nums.sorted()
        if nums.count < 3 {return 0}
        var result: Int = 0
        for i in 0..<(nums.count - 2){
            var left: Int = i + 1
            var right: Int = nums.count - 1
            while left < right {
                if nums[i] + nums[left] + nums[right] < target {
                    result += right - left
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return result
    }
}
//    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
//        if nums.count < 3 {
//            return 0
//        }
//        let nums = nums.sorted()
//        var result = 0
//        for (idx, num) in nums.enumerated() {
//            let target2Sum = target - num
//            let subarray = nums.suffix(nums.count - (idx + 1))
//            var twoSumResults = twoSum(subarray, target2Sum)
//            result += twoSumResults
//        }
//        return result
//    }
//
//    func twoSum(_ nums: [Int], _ target: Int ) -> Int {
//        if nums.count < 2 {
//            return 0
//        }
//        var result = 0
//        var start = 0
//        var end = nums.count - 1
//        while start < end {
//            while start < end && nums[start] + nums[end] >= target{
//                end -= 1
//            }
//            if start < end {
//                result += end - start
//                start += 1
//            } else {
//                break
//            }
//        }
//        return result
//    }
//}


class Q259_3Sum_Smaller: XCTestCase {

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
