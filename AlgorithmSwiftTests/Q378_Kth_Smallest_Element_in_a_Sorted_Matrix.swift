//
//  Q378_Kth_Smallest_Element_in_a_Sorted_Matrix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/14/21.
//

import XCTest

private class Solution{
func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int{
    var matrix = matrix
    var left:Int = matrix[0][0]
    var right:Int = matrix.last!.last!
    while (left < right){
        let mid:Int = left + (right - left) / 2
        let cnt:Int = search_less_equal(&matrix, mid)
        if cnt < k {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}

func search_less_equal(_ matrix:inout [[Int]], _ target: Int) -> Int{
    let n:Int = matrix.count
    var i:Int = n - 1
    var j:Int = 0
    var res:Int = 0
    while (i >= 0 && j < n){
        if matrix[i][j] <= target{
            res += i + 1
            j += 1
        } else {
            i -= 1
        }
    }
    return res
}
}

class Q378_Kth_Smallest_Element_in_a_Sorted_Matrix: XCTestCase {

    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
