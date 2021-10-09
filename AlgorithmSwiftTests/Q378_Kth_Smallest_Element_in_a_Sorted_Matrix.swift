//
//  Q378_Kth_Smallest_Element_in_a_Sorted_Matrix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/14/21.
//
/*
 Given an n x n matrix where each of the rows and columns are sorted in ascending order, return the kth smallest element in the matrix.

 Note that it is the kth smallest element in the sorted order, not the kth distinct element.

  

 Example 1:

 Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 Output: 13
 Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
 Example 2:

 Input: matrix = [[-5]], k = 1
 Output: -5
  

 Constraints:

 n == matrix.length
 n == matrix[i].length
 1 <= n <= 300
 -109 <= matrix[i][j] <= 109
 All the rows and columns of matrix are guaranteed to be sorted in non-decreasing order.
 1 <= k <= n2
 */

import XCTest

private class Solution{
//    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
//        var matrix = matrix
//        var left: Int = matrix[0][0]
////        var right: Int = matrix.last!.last!
//        var right: Int = matrix[matrix.count - 1][matrix[0].count - 1] + 1
//        var middle = 0
//        var count = 0
//        var j = matrix[0].count - 1
//        while left < right {
//            middle = left + (right - left) / 2
//            count = 0
//            j = matrix[0].count - 1
//            for i in 0..<matrix.count {
//                while j >= 0 && matrix[i][j] > middle {
//
//                }
//            }
//        }
//    }
//
    
    
    
func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int{
    var matrix = matrix
    var left:Int = matrix[0][0]
    var right:Int = matrix.last!.last!
    
    while (left < right){
        let mid:Int = left + (right - left) / 2
        let cnt:Int = search_less_equal(&matrix, mid)
        print("count is: \(cnt)")
        if cnt < k {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}
    

    
    
func search_less_equal(_ matrix: inout [[Int]], _ target: Int) -> Int{
    let n:Int = matrix.count
    var i:Int = n - 1
    var j:Int = 0
    var res:Int = 0
    while (i >= 0 && j < n){
        print("i: \(i) , j: \(j) , n: \(n)")
        if matrix[i][j] <= target{
            print("maxtrix[i][j]: \(matrix[i][j]) , target: \(target)")
            res += i + 1
            print("res: \(res)")
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
        let s = Solution()
        var matrix = [[1,5,9],[10,11,13],[12,13,15]]
        var k = 8
        let res = s.kthSmallest(matrix, k)
        print(res)
    }


}
