//
//  Q62. Unique Paths.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 62. Unique Paths

 There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

 Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

 The test cases are generated so that the answer will be less than or equal to 2 * 109.

  

 Example 1:


 Input: m = 3, n = 7
 Output: 28
 Example 2:

 Input: m = 3, n = 2
 Output: 3
 Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Down -> Down
 2. Down -> Down -> Right
 3. Down -> Right -> Down
  

 Constraints:

 1 <= m, n <= 100
 */
import XCTest
private class Solution {
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 1, count: m), count: n)
    // [1,1,1], [1,1,1],[1,1,1]  m is column, n is row
    //base case: left top is already assigned to 1 dp[0][0]
    for i in 1..<n {
        for j in 1..<m {
            dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        }
    }
    return dp[n - 1][m - 1]
}
}
class Q62__Unique_Paths: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let n = 2, m = 3
        let res = s.uniquePaths(n, m)
        print("Result is====: ", res)
    }

}
