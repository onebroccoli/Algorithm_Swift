//
//  Q244. Shortest Word Distance II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/20/22.
//
/*
 244. Shortest Word Distance II
 Design a data structure that will be initialized with a string array, and then it should answer queries of the shortest distance between two different strings from the array.

 Implement the WordDistance class:

 WordDistance(String[] wordsDict) initializes the object with the strings array wordsDict.
 int shortest(String word1, String word2) returns the shortest distance between word1 and word2 in the array wordsDict.
  

 Example 1:

 Input
 ["WordDistance", "shortest", "shortest"]
 [[["practice", "makes", "perfect", "coding", "makes"]], ["coding", "practice"], ["makes", "coding"]]
 Output
 [null, 3, 1]

 Explanation
 WordDistance wordDistance = new WordDistance(["practice", "makes", "perfect", "coding", "makes"]);
 wordDistance.shortest("coding", "practice"); // return 3
 wordDistance.shortest("makes", "coding");    // return 1
  

 Constraints:

 1 <= wordsDict.length <= 3 * 104
 1 <= wordsDict[i].length <= 10
 wordsDict[i] consists of lowercase English letters.
 word1 and word2 are in wordsDict.
 word1 != word2
 At most 5000 calls will be made to shortest.
 */
import XCTest
private class Solution {
    private var map: [String: [Int]] = [:]
    init(_ wordDict: [String]) {
        for i in 0..<wordDict.count {
            map[wordDict[i], default: []].append(i)
        }
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        var i1 = 0
        var i2 = 0
        var array1: [Int] = map[word1]!
        var array2: [Int] = map[word2]!
        var result = Int.max
        
        while i1 < array1.count && i2 < array2.count {
            result = min(result, abs(array1[i1] - array2[i2]))
            if array1[i1] < array2[i2] {
                i1 += 1
            } else {
                i2 += 1
            }
        }
        return result
    }
}
class Q244__Shortest_Word_Distance_II: XCTestCase {

    func testExample() throws {
        let a = ["practice","makes","perfect","coding","makes"]

        let obj = Solution(a)
        let res = obj.shortest("makes", "coding")
        print ("result:   ", res)
        
    }

}
