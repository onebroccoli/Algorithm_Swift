//
//  Q766. Toeplitz Matrix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/15/22.
//
/*
 766. Toeplitz Matrix
 Given an m x n matrix, return true if the matrix is Toeplitz. Otherwise, return false.

 A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same elements.

  

 Example 1:


 Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
 Output: true
 Explanation:
 In the above grid, the diagonals are:
 "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]".
 In each diagonal all elements are the same, so the answer is True.
 Example 2:


 Input: matrix = [[1,2],[2,2]]
 Output: false
 Explanation:
 The diagonal "[1, 2]" has different elements.
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 20
 0 <= matrix[i][j] <= 99
  

 Follow up:

 What if the matrix is stored on disk, and the memory is limited such that you can only load at most one row of the matrix into the memory at once?
 What if the matrix is so large that you can only load up a partial row into the memory at once?
 */
import XCTest
private class Solution {
func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    for i in 0..<matrix.count - 1 {
        for j in 0..<matrix[i].count - 1 {
            if matrix[i][j] != matrix[i + 1][j + 1] {
                return false
            }
        }
    }
    return true
}
}
class Q766__Toeplitz_Matrix: XCTestCase {

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
