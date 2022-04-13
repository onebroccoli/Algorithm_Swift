//
//  Q140. Word Break II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/11/22.
//
/*
 140. Word Break II
 Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  

 Example 1:

 Input: s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]
 Output: ["cats and dog","cat sand dog"]
 Example 2:

 Input: s = "pineapplepenapple", wordDict = ["apple","pen","applepen","pine","pineapple"]
 Output: ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
 Explanation: Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: []
  

 Constraints:

 1 <= s.length <= 20
 1 <= wordDict.length <= 1000
 1 <= wordDict[i].length <= 10
 s and wordDict[i] consist of only lowercase English letters.
 All the strings of wordDict are unique.
 */
import XCTest
private class Solution {
func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var cache = [String: [String]]()
    return dfs(s, wordDict, &cache)
}

private func dfs(_ s: String, _ wordDict: [String], _ cache: inout [String: [String]]) -> [String] {
    if s.count == 0 {
        return [""]
    }
    if let value = cache[s] {
        return value
    }
    
    var result = [String]()
    for word in wordDict {
        if s.hasPrefix(word) {
            let subWordBreaks = dfs(s.substring(from: word.endIndex), wordDict, &cache)
            for subWordBreak in subWordBreaks {
                if subWordBreak.isEmpty {
                    result.append(word)
                } else {
                    result.append(word + " " + subWordBreak)
                }
            }
        }
    }
    cache[s] = result
    return result
}
    
}
class Q140__Word_Break_II: XCTestCase {


    func testExample() throws {
        //"catsanddog"
//        ["cat","cats","and","sand","dog"]
        let s = Solution()
        let dict = ["cat","cats","and","sand","dog"]
        let a = "catsanddog"
        let result = s.wordBreak(a, dict)
        print ("result: ==== ", result)
    }


}
