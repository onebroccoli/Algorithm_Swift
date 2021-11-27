//
//  Q344_Reverse_String.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/24/21.
//

/*
 (396). Reverse String

 Write a function that reverses a string. The input string is given as an array of characters s.
 You must do this by modifying the input array in-place with O(1) extra memory.
  
 Example 1:
 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]

 Example 2:
 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]



 */
import XCTest
private class Solution {
func reverseString(_ s: inout [Character]) -> [Character] {
    var left = 0
    var right = s.count - 1
    while left < right {
        var tmp = s[left]
        s[left] = s[right]
        s[right] = tmp
        left += 1
        right -= 1
    }
    return s
}
}


class Q344_Reverse_String: XCTestCase {
   

//    func testExample() throws {
//        let s = Solution()
//        let a = ["h","e","l","l","o"]
//        var res = s.reverseString(a)
//
//    }

   

}
