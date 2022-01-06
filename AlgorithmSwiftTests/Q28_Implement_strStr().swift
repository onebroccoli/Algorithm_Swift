//
//  Q28_Implement_strStr().swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/5/22.
//
/*
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

  

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Example 3:

 Input: haystack = "", needle = ""
 Output: 0
 */
import XCTest

private class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let count1 = haystack.count
        let count2 = needle.count
        if count2 == 0 {
            return 0
        }
        
        if count1 < count2 {
            return -1
        }
        
        var haystackChars = haystack.cString(using: .utf8)!
        var needleChars = needle.cString(using: .utf8)!
        var i = 0
        var j = 0
        
        let maxi = count1 - count2
        let maxj = count2 - 1
        
        while i <= maxi && j <= maxj {
            var m = i
            while m <= count1 - 1 && j <= maxj {
                let mv = haystackChars[m]
                let jv = needleChars[j]
                if mv == jv {
                    m += 1
                    j += 1
                    continue
                }
                j = 0
                i += 1
                break
            }
        }
        j = j - 1
        if j == maxj{
            return i
        }
        
        return -1
    }
}


class Q28_Implement_strStr__: XCTestCase {

  

    func testExample() throws {
        let s = Solution()
        let a = "hello"
        let needle = "ll"
        var result = s.strStr(a, needle)
        print("RESULT: ===", result)
    }

   

}
