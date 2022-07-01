//
//  Q1197. Minimum Knight Moves.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/21/22.
//
/*
 1197. Minimum Knight Moves
 You are given a 0-indexed m x n binary matrix grid.
 In one operation, you can choose any i and j that meet the following conditions:
 0 <= i < m
 0 <= j < n
 grid[i][j] == 1
 and change the values of all cells in row i and column j to zero.
 Return the minimum number of operations needed to remove all 1's from grid.
  
 Example 1:

 Input: grid = [[1,1,1],[1,1,1],[0,1,0]]
 Output: 2
 Explanation:
 In the first operation, change all cell values of row 1 and column 1 to zero.
 In the second operation, change all cell values of row 0 and column 0 to zero.

 Example 2:

 Input: grid = [[0,1,0],[1,0,1],[0,1,0]]
 Output: 2
 Explanation:
 In the first operation, change all cell values of row 1 and column 0 to zero.
 In the second operation, change all cell values of row 2 and column 1 to zero.
 Note that we cannot perform an operation using row 1 and column 1 because grid[1][1] != 1.

 Example 3:

 Input: grid = [[0,0],[0,0]]
 Output: 0
 Explanation:
 There are no 1's to remove so return 0.

  
 Constraints:
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 15
 1 <= m * n <= 15
 grid[i][j] is either 0 or 1.

 */
import XCTest

class Q1197__Minimum_Knight_Moves: XCTestCase {

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
