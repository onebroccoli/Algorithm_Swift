//
//  Q245. Shortest Word Distance III.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/20/22.
//
/*
 245. Shortest Word Distance III

 Given an array of strings wordsDict and two strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

 Note that word1 and word2 may be the same. It is guaranteed that they represent two individual words in the list.

  

 Example 1:

 Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
 Output: 1
 Example 2:

 Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "makes"
 Output: 3
  

 Constraints:

 1 <= wordsDict.length <= 105
 1 <= wordsDict[i].length <= 10
 wordsDict[i] consists of lowercase English letters.
 word1 and word2 are in wordsDict.
 */
import XCTest
private class Solution {
func shortestWordDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
    var map: [String : [Int]] = [:]
    for i in 0..<wordsDict.count {
        map[wordsDict[i], default: []].append(i)
    }
    var i1 = 0
    var i2 = 0
    var array1 = map[word1]!
    var array2 = map[word2]!
    var minDistance = Int.max
    
    
    if word1 == word2 {
        var count = array1.count - 1
        for i in 0..<count {                    minDistance = min(minDistance, abs(array1[i + 1] - array1[i]))
        }
    } else {
        while i1 < array1.count && i2 < array2.count {
            minDistance = min(minDistance, abs(array1[i1] - array2[i2]))
            if array1[i1] < array2[i2] {
                i1 += 1
            } else {
                i2 += 1
            }
        }
    }
    return minDistance
}
}
class Q245__Shortest_Word_Distance_III: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
