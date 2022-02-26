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

class Q560__Subarray_Sum_Equals_K: XCTestCase {

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
