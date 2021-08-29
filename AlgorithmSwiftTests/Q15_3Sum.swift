//
//  Q15_3Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/16/21.
//

import XCTest
private class Solution{
    func threeSum(_ nums: [Int]) -> [[Int]] {
            var res = [[Int]]()
            guard nums.count >= 3 else {
                return res
            }
            let nums = nums.sorted()
            
            
            for i in 0..<nums.count - 2{
                if i > 0 && nums[i] == nums[i - 1]{
                    continue
                }
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    let tmp = nums[left] + nums[right]
                    if tmp + nums[i] == 0 {
                        res.append([nums[i], nums[left],nums[right]])
                        left += 1
                        while nums[left] == nums[left - 1] && left < right {
                        left += 1
                        }
                    } else if tmp + nums[i] < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            return res
        }
}



class Q15_3Sum: XCTestCase {

    

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
