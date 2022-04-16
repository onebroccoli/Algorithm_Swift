//
//  Q1539. Kth Missing Positive Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/13/22.
//
/*
 1539. Kth Missing Positive Number

 */
import XCTest
private class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var left  = 0
        var right = arr.count - 1
        while left <= right {
            var pivot = left + (right - left) / 2
            // If number of positive integers
            // which are missing before arr[pivot]
            // is less than k -->
            // continue to search on the right.
            if arr[pivot] - pivot - 1 < k {
                left = pivot + 1
            } else {
                right = pivot - 1
            }
        }
        // At the end of the loop, left = right + 1,
        // and the kth missing is in-between arr[right] and arr[left].
        // The number of integers missing before arr[right] is
        // arr[right] - right - 1 -->
        // the number to return is
        // arr[right] + k - (arr[right] - right - 1) = k + left
        
        return left + k
    }
}
class Q1539__Kth_Missing_Positive_Number: XCTestCase {

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
