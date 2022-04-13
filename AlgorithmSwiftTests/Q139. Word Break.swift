//
//  Q139. Word Break.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/12/22.
//
/*
 139. Word Break
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  

 Example 1:

 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:

 Input: s = "applepenapple", wordDict = ["apple","pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: false
  

 Constraints:

 1 <= s.length <= 300
 1 <= wordDict.length <= 1000
 1 <= wordDict[i].length <= 20
 s and wordDict[i] consist of only lowercase English letters.
 All the strings of wordDict are unique.
 */
import XCTest
private class Solution {
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var visited = [Int: Bool]()
    var queue = [Int]()
    queue.append(0)
    
    while !queue.isEmpty {
        let start = queue.removeFirst()
        if visited[start] ?? false { continue }
        let startIndex = s.index(s.startIndex, offsetBy: start)
        var end = start + 1
        while end <= s.count {
            let endIndex = s.index(startIndex, offsetBy: end - start)
            if wordDict.contains(String(s[startIndex..<endIndex])) {
                queue.append(end)
                if end == s.count {
                    return true
                }
            }
            end += 1
        }
        visited[start] = true
    }
    return false
}
}
class Q139__Word_Break: XCTestCase {

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
