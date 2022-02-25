//
//  Q16_3Sum_Closest.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/16/21.
//
/*
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

  

 Example 1:

 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

 */
import XCTest

private class Solution{
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var diff = Int.max
    let nums = nums.sorted()
    
    
    
    for i in 0..<nums.count {
        var low = i + 1
        var high = nums.count - 1
        while low < high {
            var sum = nums[i] + nums[low] + nums[high]
            if abs(target - sum ) < abs(diff) {
                diff = target - sum
            }
            if diff == 0 {
                return target - diff
            } else {
                if sum < target {
                    low += 1
                } else {
                    high -= 1
                }
            }
            
            
        }
        
        
    }
    return target - diff
    
    
}

}

class Q16_3Sum_Closest: XCTestCase {

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
