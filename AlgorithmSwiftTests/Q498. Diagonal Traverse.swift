//
//  Q498. Diagonal Traverse.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/9/22.
//
/*
 498. Diagonal Traverse
 Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.

  

 Example 1:


 Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,4,7,5,3,6,8,9]
 Example 2:

 Input: mat = [[1,2],[3,4]]
 Output: [1,2,3,4]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 104
 1 <= m * n <= 104
 -105 <= mat[i][j] <= 105
 */
import XCTest
private class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        guard matrix.count != 0 else {
            return result
        }
        let row = matrix.count
        let col = matrix[0].count
        var rowIndex = 0
        var colIndex = 0
        while result.count != row*col {
            result.append(matrix[rowIndex][colIndex])
            if (rowIndex + colIndex) % 2 == 0 {
                //if last column, rowindex + 1, if not , max(0, rowIndex - 1) go up one level
                //col: (col - 1, colIndex+1)
                rowIndex = (colIndex == col - 1) ? rowIndex + 1 : max(0, rowIndex - 1)
                colIndex = min(col - 1, colIndex + 1)
            } else {
                //Col: if last row, col + 1, if not, max(0, colIndex - 1)go left one column
                //Row: min(row - 1 , rowIndex + 1)
                colIndex = (rowIndex == row - 1) ? colIndex + 1 : max(0, colIndex - 1)
                rowIndex = min(row - 1, rowIndex + 1)
            }
        }
        return result
    }
}
class Q498__Diagonal_Traverse: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
        let result = s.findDiagonalOrder(matrix)
        print("RESULT: ==   ", result)
    }

  

}
