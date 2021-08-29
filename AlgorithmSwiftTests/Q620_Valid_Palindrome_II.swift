//
//  Q620_Valid_Palindrome_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/23/21.

import XCTest
private class Solution{
    func validPalindrome(_ s: String) -> Bool {
            let arr = Array(s)
            var left = 0, right = arr.count - 1
            while left < right {
                if (arr[left] != arr[right]){
                    return isPalindrome(s, left + 1, right) || isPalindrome(s, left, right - 1)
                } else {
                    left += 1
                    right -= 1
                }
            }
            return true
        }
        
    func isPalindrome(_ s: String, _ left: Int, _ right: Int) -> Bool {
        let arr = Array(s)
        var l = left, r = right
        while l < r {
            if arr[l] != arr[r]{
                return false
            } else {
                l += 1
                r -= 1
            }
        }
        return true
    }
}
class Q620_Valid_Palindrome_II: XCTestCase {
    func testExample() throws {
        let s = Solution()
        let result = s.validPalindrome("abbca")
        let expected = true
        XCTAssert(result == expected)
    }
}
