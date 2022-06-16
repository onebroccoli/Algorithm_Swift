//
//  L23_Shift_Position.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/13/22.
//
/*
L 23. Shift Position
 Given an integer array A, A is sorted in ascending order first then shifted by an arbitrary number of positions, For Example, A = {3, 4, 5, 1, 2} (shifted left by 2 positions). Find the index of the smallest number.

 Assumptions

 There are no duplicate elements in the array
 Examples

 A = {3, 4, 5, 1, 2}, return 3
 A = {1, 2, 3, 4, 5}, return 0
 Corner Cases

 What if A is null or A is of zero length? We should return -1 in this case.
 */
import XCTest


private class Solution {
func shift(_ nums: [Int]) -> Int {
    if nums.count == 0 || nums.isEmpty {
        return -1
    }
    
    var left = 0
    var right = nums.count - 1
    //corner case: never been shifted
    if nums[right] > nums[left] {
        return 0
    }
    
    while left < right - 1 {
        var mid = left + (right - left) / 2
        if nums[mid] < nums[left] {
            right = mid
        } else {
            left = mid + 1
            45123
            //left moves one step to right, if we find the ascending order now, it means left is the starting index.
            if nums[right] > nums[left] {
                return left
            }
        }
        
    }
    if nums[left] < nums[right] {
        return left
    } else {
        return right
    }
}
}

class L23_Shift_Position: XCTestCase {

    func testExample() throws {
        let s = Solution()
//        let a = [5,1,3]
        let a = [4,5,1,2,3]
        var result = s.shift(a)
        print ("result : == ",result)
    }

 

}
