//
//  Q74_Search_a_2D_Matrix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/26/21.
//

/*
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
  

 Example 1:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 Example 2:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false
 
 */

import XCTest

private class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix == nil || matrix[0].count == 0 {
            return false
        }
        var row = matrix.count
        var col = matrix[0].count
        var left = 0
        var right = row * col - 1
        while left <= right {
            let mid = left + (right - left) / 2
            var tmpRow = mid / col
            var tmpCol = mid % col
            if matrix[tmpRow][tmpCol] == target {
                return true
            } else if matrix[tmpRow][tmpCol] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}


class Q74_Search_a_2D_Matrix: XCTestCase {

   

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }



}
