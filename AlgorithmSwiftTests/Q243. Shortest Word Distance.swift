//
//  Q243. Shortest Word Distance.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/20/22.
//
/*
 243. Shortest Word Distance
 Given an array of strings wordsDict and two different strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

  

 Example 1:

 Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "coding", word2 = "practice"
 Output: 3
 Example 2:

 Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
 Output: 1
  

 Constraints:

 1 <= wordsDict.length <= 3 * 104
 1 <= wordsDict[i].length <= 10
 wordsDict[i] consists of lowercase English letters.
 word1 and word2 are in wordsDict.
 word1 != word2
 */

import XCTest
private class Solution {
func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
    var i1 = -1
    var i2 = -1
    var minDistance = wordsDict.count
    for i in 0..<wordsDict.count {
        if wordsDict[i] == word1 {
            i1 = i
        } else if wordsDict[i] == word2 {
            i2 = i
        }
        
        if i1 != -1 && i2 != -1 {
            minDistance = min(abs(i1 - i2), minDistance)
        }
    }
    
    
    
    return minDistance
}
}
class Q243__Shortest_Word_Distance: XCTestCase {

  

    func testExample() throws {
       let s = Solution()
    let array = ["a","a","b","b"]
        let result = s.shortestDistance(array, "a", "b")
        print ("result: ", result)
    }

   

}
