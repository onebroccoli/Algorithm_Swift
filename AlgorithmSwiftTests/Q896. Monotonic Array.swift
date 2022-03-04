//
//  Q896. Monotonic Array.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/3/22.
//
/*
 896. Monotonic Array
 An array is monotonic if it is either monotone increasing or monotone decreasing.

 An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j]. An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].

 Given an integer array nums, return true if the given array is monotonic, or false otherwise.

  

 Example 1:

 Input: nums = [1,2,2,3]
 Output: true
 Example 2:

 Input: nums = [6,5,4,4]
 Output: true
 Example 3:

 Input: nums = [1,3,2]
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 -105 <= nums[i] <= 105
 */
import XCTest
private class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        var increasing = true
        var decreasing = true
        for i in 0..<nums.count-1 {
            //notice = is not used here.
            //decreasing
            if nums[i] > nums[i + 1] {
                increasing = false
            }
            
            //increasing
            if nums[i] < nums[i + 1] {
                decreasing = false
            }
        }
        return increasing || decreasing //has to be one direction
    }
}
class Q896__Monotonic_Array: XCTestCase {

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
