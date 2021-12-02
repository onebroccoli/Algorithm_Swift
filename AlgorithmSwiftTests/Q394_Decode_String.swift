//
//  Q394_Decode_String.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/1/21.
//
/*
 394. Decode String
 Given an encoded string, return its decoded string.
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.
 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].
  
 Example 1:
 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"

 Example 2:
 Input: s = "3[a2[c]]"
 Output: "accaccacc"

 Example 3:
 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"

 Example 4:
 Input: s = "abc3[cd]xyz"
 Output: "abccdcdcdxyz"

 */
import XCTest

class Q394_Decode_String: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
