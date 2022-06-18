//
//  L24. Total Occurrence.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/15/22.
//
/*
 24. Total Occurrence
 Given a target integer T and an integer array A sorted in ascending order, Find the total number of occurrences of T in A.

 Examples

 A = {1, 2, 3, 4, 5}, T = 3, return 1
 A = {1, 2, 2, 2, 3}, T = 2, return 3
 A = {1, 2, 2, 2, 3}, T = 4, return 0
 Corner Cases

 What if A is null? We should return 0 in this case.
 */
import XCTest

private class Solution {
    func totalOccurence(_ array: [Int], _ target: Int) -> Int {
        if array == nil || array.count == 0 {
            return 0
        }
        var left = 0
        var right = array.count - 1
        var count = 0
        while left <= right {
            var mid = left + (right - left) / 2
            if array[mid] < target {
                left = mid + 1
            } else if array[mid] > target {
                right = mid - 1
            } else { //if array[mid] == target
                
            }
        }
    }
}

class L24__Total_Occurrence: XCTestCase {

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
