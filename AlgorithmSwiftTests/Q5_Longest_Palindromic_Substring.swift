//
//  Q5_Longest_Palindromic_Substring.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/18/22.
//
/*
 5. Longest Palindromic Substring
 Given a string s, return the longest palindromic substring in s.

  

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
  


 */
import XCTest
private class Solution {
func longestPalindrome(_ s: String) -> String {
    guard  s.count > 1 else {
        return s
    }
    let chars = Array(s)
    var maxLen: Int = 0
    var start: Int = 0
    
    for i in 0..<chars.count {
        helper(chars, i, i, &maxLen, &start)
        helper(chars, i, i+1, &maxLen, &start)
        
        
    }
    return String(chars[start..<start+maxLen])
}


func helper(_ chars:[Character], _ l: Int, _ r: Int, _ maxLen: inout Int, _ start: inout Int) {
    var l: Int = l
    var r: Int = r
    while l >= 0 && r < chars.count && chars[l] == chars[r]{
        l -= 1
        r += 1
    }
    
    if maxLen < r - l - 1 {
        start = l + 1
        maxLen = r - l - 1
    }
}
    
}
class Q5_Longest_Palindromic_Substring: XCTestCase {

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
