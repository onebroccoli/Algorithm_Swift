//
//  Q1427_Perform_String_Shifts.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/29/21.
//
/*
 1427. Perform String Shifts

 
 Lai 397. Right Shift By N Characters

 You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [directioni, amounti]:

 directioni can be 0 (for left shift) or 1 (for right shift).
 amounti is the amount by which string s is to be shifted.
 A left shift by 1 means remove the first character of s and append it to the end.
 Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
 Return the final string after all operations.

  

 Example 1:

 Input: s = "abc", shift = [[0,1],[1,2]]
 Output: "cab"
 Explanation:
 [0,1] means shift to left by 1. "abc" -> "bca"
 [1,2] means shift to right by 2. "bca" -> "cab"
 Example 2:

 Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]]
 Output: "efgabcd"
 Explanation:
 [1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
 [1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
 [0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
 [1,3] means shift to right by 3. "abcdefg" -> "efgabcd"
 
 
 */
import XCTest

private class Solution {
func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    if s.count <= 1 {
        return s
    }
    var array = Array(s)
    //merge direction shift summary
    var shiftCount = 0 // negative means towards left, positive means towards right
    for singleShift in shift {
        if singleShift[0] == 0 {
            shiftCount -= singleShift[1]
        }
        if singleShift[0] == 1 {
            shiftCount += singleShift[1]
        }
    }
    var steps = abs(shiftCount % array.count)
    print(steps)
    //right shift
    var res : [Character] =  []
    if shiftCount > 0 {
        return String(array[array.count - steps..<array.count]) + String(array[0..<array.count - steps])
    }
    if shiftCount < 0 {
        return String(array[steps..<array.count]) + String(array[0..<steps])
    }
    return String(res)
}

}


class Q1427_Perform_String_Shifts: XCTestCase {
    func testExample() throws {
        let s = Solution()
        let a = "abcsfg"
        let shifts = [[0,1]]
        let res = s.stringShift(a, shifts)
        print ("res ======: ", res)
    }

}
