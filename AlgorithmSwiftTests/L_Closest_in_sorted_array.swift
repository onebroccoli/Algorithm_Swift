//
//  L_Closest_in_sorted_array.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/19/21.
//
/*
 Given a target integer T and an integer array A sorted in ascending order, find the index i in A such that A[i] is closest to T.

 Assumptions

 There can be duplicate elements in the array, and we can return any of the indices with same value.
 Examples

 A = {1, 2, 3}, T = 2, return 1
 A = {1, 4, 6}, T = 3, return 1
 A = {1, 4, 6}, T = 5, return 1 or 2
 A = {1, 3, 3, 4}, T = 2, return 0 or 1 or 2
 Corner Cases

 What if A is null or A is of zero length? We should return -1 in this case.
 */

import XCTest
private class Solution {
    func closest(_ array: [Int], _ target: Int) -> Int {
        if array == nil || array.count == 0 {
            return -1
        }
        var left = 0
        var right = array.count - 1
        while left < right - 1 {
            var mid = left + (right - left) / 2
            if array[mid] <= target {
                left = mid
            } else {
                right = mid
            }
        }
        if abs(array[left] - target) <= abs(array[right] - target) {
            return left
        }
        return right
    }
}


class L_Closest_in_sorted_array: XCTestCase {

    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
