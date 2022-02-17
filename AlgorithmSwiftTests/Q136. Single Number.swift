//
//  Q136. Single Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/16/22.
//

/*
 136. Single Number
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.

  

 Example 1:

 Input: nums = [2,2,1]
 Output: 1
 Example 2:

 Input: nums = [4,1,2,1,2]
 Output: 4
 Example 3:

 Input: nums = [1]
 Output: 1
  

 Constraints:

 1 <= nums.length <= 3 * 104
 -3 * 104 <= nums[i] <= 3 * 104
 Each element in the array appears twice except for one element which appears only once.
 */
private class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var map: [Int : Bool] = [:]
        for i in nums {
            if map[i] == nil {
                map[i] = true
            } else {
                map[i] = nil
            }
        }
        return map.keys.first!
    }
func singleNumberBit(_ nums: [Int]) -> Int {
    var a = 0
    for i in nums {
        a ^= i
    }
    return a
}

func singleNumberBit2(_ nums: [Int]) -> Int {
    nums.reduce(0, ^)
}
}
import XCTest

class Q136__Single_Number: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
