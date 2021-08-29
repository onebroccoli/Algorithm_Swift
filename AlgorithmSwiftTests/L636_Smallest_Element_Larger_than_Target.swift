//
//  L636_Smallest_Element_Larger_than_Target.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/27/21.
//
/*
 Given a target integer T and an integer array A sorted in ascending order, find the index of the smallest element in A that is larger than T or return -1 if there is no such index.

 Assumptions
 There can be duplicate elements in the array.

 Examples
 A = {1, 2, 3}, T = 1, return 1
 A = {1, 2, 3}, T = 3, return -1
 A = {1, 2, 2, 2, 3}, T = 1, return 1

 Corner Cases
 What if A is null or A of zero length? We should return -1 in this case.

 
 */
import XCTest
private class Solution{
    func smallestElementLargerThanTarget(_ array: [Int], _ target: Int) -> Int {
        if array.count == 0 {
            return -1
        }
        var left = 0
        var right = array.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if array[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        //if left reach the end + 1
        if left == array.count {
            return -1
        }
        return left
    }
}


class L636_Smallest_Element_Larger_than_Target: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let arr = [1,2,3]
        let target = 1
        let result = s.smallestElementLargerThanTarget(arr, target)
        let expected = 1
        XCTAssert(result == expected);

    }

    

}
