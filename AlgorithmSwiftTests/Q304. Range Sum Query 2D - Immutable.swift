//
//  Q304. Range Sum Query 2D - Immutable.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/22/22.
//
/*
 304. Range Sum Query 2D - Immutable
 Given a 2D matrix matrix, handle multiple queries of the following type:

 Calculate the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).
 Implement the NumMatrix class:

 NumMatrix(int[][] matrix) Initializes the object with the integer matrix matrix.
 int sumRegion(int row1, int col1, int row2, int col2) Returns the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).
  

 Example 1:


 Input
 ["NumMatrix", "sumRegion", "sumRegion", "sumRegion"]
 [[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [1, 1, 2, 2], [1, 2, 2, 4]]
 Output
 [null, 8, 11, 12]

 Explanation
 NumMatrix numMatrix = new NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]);
 numMatrix.sumRegion(2, 1, 4, 3); // return 8 (i.e sum of the red rectangle)
 numMatrix.sumRegion(1, 1, 2, 2); // return 11 (i.e sum of the green rectangle)
 numMatrix.sumRegion(1, 2, 2, 4); // return 12 (i.e sum of the blue rectangle)
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 200
 -105 <= matrix[i][j] <= 105
 0 <= row1 <= row2 < m
 0 <= col1 <= col2 < n
 At most 104 calls will be made to sumRegion.
 */
import XCTest
private class Solution {
    var data = [[Int]]()
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = 0
        for r in row1...row2 {
            for c in col1...col2 {
                sum += data[r][c]
            }
        }
        return sum
    }
}

private class NumMatrix {
    private var data = [[Int]]()
init(_ matrix: [[Int]]) {
    if matrix.count == 0 || matrix[0].count == 0 {
        return
    }
    data = Array(repeating: Array(repeating: 0, count: matrix[0].count  + 1), count: matrix.count + 1)
    


    //count column sum, plus pre-row column sum to get volumn sum
    for (r, row) in matrix.enumerated() {
        var sum = 0
        for (c, value) in row.enumerated() {
            sum += value
            data[r + 1][c + 1] = data[r][c + 1] + sum
        }
    }
    
}


func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
    return data[row2 + 1][col2 + 1] - data[row2 + 1][col1] - data[row1][col2+1] + data[row1][col1]


}
}
class Q304__Range_Sum_Query_2D___Immutable: XCTestCase {

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
