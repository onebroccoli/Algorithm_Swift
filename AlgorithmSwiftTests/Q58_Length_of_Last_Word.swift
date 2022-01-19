//
//  Q58_Length_of_Last_Word.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/18/22.
//
/*
 58. Length of Last Word
 Given a string s consisting of some words separated by some number of spaces, return the length of the last word in the string.

 A word is a maximal substring consisting of non-space characters only.

  

 Example 1:

 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.
 Example 2:

 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.
 Example 3:

 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.
  


 */
import XCTest
private class Solution {
func lengthOfLastWord(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    let s = Array(s)
    var length = s.count
    var lastWordLength = 0
    
    //trim
    //move left to remove the spaces at the end
    while length > 0 && s[length - 1] == " " {
        length -= 1
    }
    while length > 0 && s[length - 1] != " " {
        lastWordLength += 1
        length -= 1
    }
    return lastWordLength
}
    
}
class Q58_Length_of_Last_Word: XCTestCase {

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
