//
//  Q340_Longest_Substring_with_At_Most_K_Distinct_Characters.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/20/21.
//
/*
 Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.

  

 Example 1:

 Input: s = "eceba", k = 2
 Output: 3
 Explanation: The substring is "ece" with length 3.
 Example 2:

 Input: s = "aa", k = 1
 Output: 2
 Explanation: The substring is "aa" with length 2.

 */

import XCTest

//magically works but dont understand the reason

private class SolutionBackup{
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        guard k > 0 else {
            return 0
        }

        let s = Array(s)
        var start = 0, longest = 0, charsFreq = [Character: Int]()

        for (i, char) in s.enumerated() {
            //case1: if meet existing character within k range
            if let freq = charsFreq[char] {
                charsFreq[char] = freq + 1
            } else {
                //case2: if meet new character
                //   2.1 if k characters already filled
                while charsFreq.count == k {
                    //update longest length
                    longest = max(i - start, longest)

                    //pull the frequency for the first character
                    guard let freq = charsFreq[s[start]] else {
                        fatalError()
                    }
                    //if 1st character frequency = 1, delete it from hashset
                    //if 1st character frequency > 1, then freq-1
                    charsFreq[s[start]] = freq == 1 ? nil : freq - 1

                    start += 1
                }
                //  2.2 if k character not filled, insert into hashset
                charsFreq[char] = 1
            }
        }

        return max(longest, s.count - start)
    }
}


private class Solution{
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        
        
        
        var start = 0, maxLen = 0, charFreq = [Character : Int]()
        let chars = Array(s)
        
        if k <= 0 || chars.count == 0 {return 0}
        
        for (i, char) in chars.enumerated(){
            //case1: if hashset already has char, increment frequency +1
            if let freq = charFreq[char]{
                charFreq[char] = freq + 1
            } else {
                //case2: if the third char appears, if hashset already has 2 chars, update maxLen
                //  find the first character chars[start]
                //  if first character frequency decreases to 0, set to nil => delete that character
                // start move over one by one
                while charFreq.count == k{
                    maxLen = max(maxLen, i - start)
                    let charStart = chars[start]
                    charFreq[charStart]! -= 1
                    if charFreq[charStart] == 0 {
                        charFreq[charStart] = nil
                    }
                    start += 1
                }
                charFreq[char] = 1
            }
        }
        return max(maxLen, chars.count - start)
    }
}

class Q340_Longest_Substring_with_At_Most_K_Distinct_Characters: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let s = Solution()
        let a = "eceba"
        let result = s.lengthOfLongestSubstringKDistinct(a, 2)
        let expected = 3
        XCTAssert(result == expected)
    }
}
