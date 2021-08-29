//
//  Q3_Longest_Substring_Without_Repeating_Characters.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/21/21.
//

import XCTest

/*
 Given a string s, find the length of the longest substring without repeating characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 Example 4:

 Input: s = ""
 Output: 0
 */
//0 1 2 3 4 5 6
//a b c a b e f
//
//max
//startIdx
//
//dict()
//a: 4
//b:5
//c:3
//e: 6
//f:7
//
//pos = 1
//startIdx = max(0, 1) = 1
//max = 3
//max = (3, 3- 1+1) = 3
//
//pos = [b] = 2
//sartidx = max(1, 2) = 2
//
//max = (3, 4-2+1) = 3
//max = (3, 5 - 2+1) = 4
//max = (4, 6-2+1)
private class Solution{
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLen = 0, startIdx = 0, seenCharToPos = [Character: Int]()
        let sChars = Array(s)
        for (i, char) in sChars.enumerated(){
            if let pos = seenCharToPos[char]{
                startIdx = max(startIdx, pos)
            }
            //update to next valid position
            seenCharToPos[char] = i + 1
            maxLen = max(maxLen, i - startIdx + 1)
            
        }
        return maxLen
    }
}


class Q3_Longest_Substring_Without_Repeating_Characters: XCTestCase {
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let s = Solution()
        let result = s.lengthOfLongestSubstring("abcabef")
        let expected = 5
        XCTAssert(result == expected)
    }

}
