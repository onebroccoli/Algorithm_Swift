//
//  Q59_Longest_Substring_with_At_Most_Two_Distinct_Characters.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/21/21.
//

import XCTest
/*
 Given a string s, return the length of the longest substring that contains at most two distinct characters.

  

 Example 1:

 Input: s = "eceba"
 Output: 3
 Explanation: The substring is "ece" which its length is 3.
 Example 2:

 Input: s = "ccaabbb"
 Output: 5
 Explanation: The substring is "aabbb" which its length is 5.
 */
private class Solution{
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int{
        var start = 0, maxLen = 0, charFreq = [Character : Int]()
        let chars = Array(s)
        for (i, char) in chars.enumerated(){
            //case1: if hashset already has char, increment frequency +1
            if let freq = charFreq[char]{
                charFreq[char] = freq + 1
            } else {
                //case2: if the third char appears, if hashset already has 2 chars, update maxLen
                //  find the first character chars[start]
                //  if first character frequency decreases to 0, set to nil => delete that character
                // start move over one by one
                while charFreq.count == 2 {
                    maxLen = max(maxLen, i - start)
                    let charStart = chars[start]
                    charFreq[charStart]! -= 1
                    if charFreq[charStart] == 0 {
                        charFreq[charStart] = nil
                    }
                    start += 1
                }
                //when charFreq.count < 2, insert the new character into hashset
                charFreq[char] = 1
            }
        }
        return max(maxLen, chars.count - start)
    }
}


class Q159_Longest_Substring_with_At_Most_Two_Distinct_Characters: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let a = "abcababb"
        let result = s.lengthOfLongestSubstringTwoDistinct(a)
        let expected = 5
        XCTAssert(result == expected);
    }
}
