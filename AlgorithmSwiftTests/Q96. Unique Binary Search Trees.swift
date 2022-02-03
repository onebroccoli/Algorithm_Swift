//
//  Q96. Unique Binary Search Trees.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/2/22.
//
/*
 96. Unique Binary Search Trees
 Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

  

 Example 1:


 Input: n = 3
 Output: 5
 Example 2:

 Input: n = 1
 Output: 1

 */
import XCTest
private class Solution {
func numTrees(_ n: Int) -> Int {
    var G: [Int] = Array(repeating: 0, count: n + 1)
    G[0] = 1
    G[1] = 1
    
    for i in 2...n {
        for j in 1...i {
            G[i] += G[j - 1] * G[i - j]
        }
    }
    return G[n]
}
}
class Q96__Unique_Binary_Search_Trees: XCTestCase {

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
