//
//  Q240_Search_a_2D_Matrix_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/26/21.
//
/*
 Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
  

 Example 1:


 Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
 Output: true
 Example 2:


 Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
 Output: false
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= n, m <= 300
 -109 <= matix[i][j] <= 109
 All the integers in each row are sorted in ascending order.
 All the integers in each column are sorted in ascending order.
 -109 <= target <= 109

 
 */
import XCTest
private class Solution{
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix[0].count == 0 {
            return false
        }
        //iterate over matrix diagnals
        let shorterDim = min(matrix.count, matrix[0].count);
        for i in 0..<shorterDim {
            let verticalFound = binarySearch(matrix, target, i, true);
            let horizontalFound = binarySearch(matrix, target, i, false);
            if (verticalFound || horizontalFound){
                return true
            }
        }
        return false
    }
    
    func binarySearch(_ matrix: [[Int]], _ target: Int, _ start: Int, _ vertical: Bool) -> Bool {
        var lo = start
        var hi = vertical ? matrix[0].count - 1 : matrix.count - 1
        while (lo <= hi){
            let mid = (lo + hi) / 2
            //search column
            if vertical {
                if matrix[start][mid] == target {
                    return true
                } else if matrix[start][mid] < target {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            //search row
            } else {
                if matrix[mid][start] == target {
                    return true
                } else if matrix[mid][start] < target{
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        return false
    }
}



class Q240_Search_a_2D_Matrix_II: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5)
        let expected = true
        XCTAssert(result == expected);
    }

}
