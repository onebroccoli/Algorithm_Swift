//
//  Q474. Ones and Zeroes.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/30/22.
//
/*
 474. Ones and Zeroes
 You are given an array of binary strings strs and two integers m and n.

 Return the size of the largest subset of strs such that there are at most m 0's and n 1's in the subset.

 A set x is a subset of a set y if all elements of x are also elements of y.

  

 Example 1:

 Input: strs = ["10","0001","111001","1","0"], m = 5, n = 3
 Output: 4
 Explanation: The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
 Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
 {"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.
 Example 2:

 Input: strs = ["10","0","1"], m = 1, n = 1
 Output: 2
 Explanation: The largest subset is {"0", "1"}, so the answer is 2.
  

 Constraints:

 1 <= strs.length <= 600
 1 <= strs[i].length <= 100
 strs[i] consists only of digits '0' and '1'.
 1 <= m, n <= 100
 */
import XCTest
private class Solution {
func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    //construct 2d dp array
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m + 1)
    for str in strs {
        var zeroes: Int = 0
        var ones: Int = 0
        for i in str {
            if i == "0" {
                zeroes += 1
            } else {
                ones += 1
            }
        }
        if zeroes <= m && ones <= n {
            for i in (zeroes...m).reversed() {
                for j in (ones...n).reversed(){
                    //dp formula:
                    dp[i][j] = max(dp[i][j], dp[i - zeroes][j - ones] + 1)
                }
            }
        }
    }
    return dp[m][n]
}
}
class Q474__Ones_and_Zeroes: XCTestCase {

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
