//
//  Q680. Valid Palindrome II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/23/22.
//
/*
 680. Valid Palindrome II
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

  

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 */
import XCTest
private calss Solution {
func validPalindrome(_ s: String) -> Bool {
    var i = 0
    var count = 0
    var chars = Array(s)
    var j = chars.count - 1
    
    while i <= j {
        if chars[i] != chars[j] {
            return isPalindrome(chars, i + 1, j) || isPalindrome(chars, i, j - 1)
        }
        i += 1
        j -= 1
    }
    return true
}


func isPalindrome(_ chars: [Character], _ i: Int, _ j: Int) -> Bool {
    var left = i
    var right = j
    while left < right {
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right -= 1
        
    }
    return true
    
}
}
class Q680__Valid_Palindrome_II: XCTestCase {

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
