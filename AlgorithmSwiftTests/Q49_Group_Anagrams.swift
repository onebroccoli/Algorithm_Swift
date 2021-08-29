//
//  Q49_Group_Anagrams.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/12/21.
//
/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
  
 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Example 2:
 Input: strs = [""]
 Output: [[""]]

 Example 3:
 Input: strs = ["a"]
 Output: [["a"]]

  
 Constraints:
 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lower-case English letters.

 */
import XCTest
private class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[String] : [String]]()
        for str in strs {
            let temp = str.map{ String($0)}.sorted()
            if dict.keys.contains(temp) {
                dict[temp]?.append(str)
            } else {
                dict[temp] = [str]
            }
        }
        print (Array(dict.values))
        return Array(dict.values)
    }
    
}
class Q49_Group_Anagrams: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
        print (result)
    }


}



