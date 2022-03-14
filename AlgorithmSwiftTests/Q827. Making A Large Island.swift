//
//  Q827. Making A Large Island.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/7/22.
//
/*
 827. Making A Large Island
 You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.

 Return the size of the largest island in grid after applying this operation.

 An island is a 4-directionally connected group of 1s.

  

 Example 1:

 Input: grid = [[1,0],[0,1]]
 Output: 3
 Explanation: Change one 0 to 1 and connect two 1s, then we get an island with area = 3.
 Example 2:

 Input: grid = [[1,1],[1,0]]
 Output: 4
 Explanation: Change the 0 to 1 and make the island bigger, only one island with area = 4.
 Example 3:

 Input: grid = [[1,1],[1,1]]
 Output: 4
 Explanation: Can't change any 0 to 1, only one island with area = 4.
  

 Constraints:

 n == grid.length
 n == grid[i].length
 1 <= n <= 500
 grid[i][j] is either 0 or 1.
 */
import XCTest
//private class Solution {
//    var grid: [[Int]] = []
//    let directions: [[Int]] = [[1,0],[-1,0],[0,1],[0,-1]]
//   
//    func largestIsland(_ grid: [[Int]]) -> Int {
//        var N = grid.count
//        var index = 2
//        var area: [Int] = Array(repeating: -1, count: N*N + 2)
//        for r in 0..<N {
//            for c in 0..<N {
//                if grid[r][c] == 1 {
//                    area[index] = dfs(r, c, index)
//                    index += 1
//                }
//            }
//        }
//        var ans = 0
//        for x in area {
//            ans = max(ans, x) 
//        }
//        
//        
//        
//    }
//}
class Q827__Making_A_Large_Island: XCTestCase {

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
