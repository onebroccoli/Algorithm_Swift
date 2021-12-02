//
//  Q197_ReOrder_Array.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/30/21.
//
/*
 
 197. ReOrder Array
 Given an array of elements, reorder it as follow:

 { N1, N2, N3, …, N2k } → { N1, Nk+1, N2, Nk+2, N3, Nk+3, … , Nk, N2k }

 { N1, N2, N3, …, N2k+1 } → { N1, Nk+1, N2, Nk+2, N3, Nk+3, … , Nk, N2k, N2k+1 }

 Try to do it in place.

 Assumptions

 The given array is not null
 Examples

 { 1, 2, 3, 4, 5, 6} → { 1, 4, 2, 5, 3, 6 }

 { 1, 2, 3, 4, 5, 6, 7, 8 } → { 1, 5, 2, 6, 3, 7, 4, 8 }

 { 1, 2, 3, 4, 5, 6, 7 } → { 1, 4, 2, 5, 3, 6, 7 }


 */
import XCTest

private class Solution {
func reorder(_ array: [Int]) -> [Int] {
    var array = array
    //assumption: array is not nil
    //0 1 2 3 4 5 6
    //1 2 3 4 5 6 7
    if array.count <= 2 {
        return array
    }
    var length = array.count / 2
    var left = 0
    var right = length
    var res : [Int] = []
    while length > 0 {
        res.append(array[left])
        res.append(array[right])
        left += 1
        right += 1
        length -= 1
    }
    if array.count % 2 == 1 {
        res.append(array[array.count - 1])
    }
    return res
}
    
}
class Q197_ReOrder_Array: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let a = [1,2,3,4,5]
        var result = s.reorder(a)
        print("RESULT:====== ",result)
    }

 
}
