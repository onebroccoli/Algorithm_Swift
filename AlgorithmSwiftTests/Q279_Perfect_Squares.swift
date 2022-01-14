//
//  Q279_Perfect_Squares.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/13/22.
//
/*
 Given an integer n, return the least number of perfect square numbers that sum to n.

 A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

  

 Example 1:

 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:

 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
 */
import XCTest
private class Solution {
func numSquares(_ n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: n+1)
    //base care
    dp[0] = 0
    
    //precalculate the square numbers
    var upperbound = Int(sqrt(Double(n))) + 1
    var squareNums = Array(repeating: 0, count: upperbound+1)
    squareNums[0] = 0
    squareNums.append(0)
    for i in 1..<upperbound {
        squareNums[i] = i * i
    }
    for i in 1...n {
        for s in 1..<upperbound {
            if i < squareNums[s] {
                break
            }
            dp[i] = min(dp[i],dp[i-squareNums[s]] + 1)
        }
    }
    return dp[n]
}
}
class Q279_Perfect_Squares: XCTestCase {

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
