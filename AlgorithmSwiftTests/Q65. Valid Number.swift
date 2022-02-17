//
//  Q65. Valid Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/16/22.
//
/*
 65. Valid Number
 A valid number can be split up into these components (in order):
 A decimal number or an integer.
 (Optional) An 'e' or 'E', followed by an integer.
 A decimal number can be split up into these components (in order):
 (Optional) A sign character (either '+' or '-').
 One of the following formats:
 One or more digits, followed by a dot '.'.
 One or more digits, followed by a dot '.', followed by one or more digits.
 A dot '.', followed by one or more digits.
 An integer can be split up into these components (in order):
 (Optional) A sign character (either '+' or '-').
 One or more digits.
 For example, all the following are valid numbers: ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"], while the following are not valid numbers: ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"].
 Given a string s, return true if s is a valid number.
 
 Example 1:
 Input: s = "0"
 Output: true
 
 Example 2:
 Input: s = "e"
 Output: false
 
 Example 3:
 Input: s = "."
 Output: false
 
 
 Constraints:
 1 <= s.length <= 20
 s consists of only English letters (both uppercase and lowercase), digits (0-9), plus '+', minus '-', or dot '.'.
 
 
 */
import XCTest
private class Solution {
    func isNumber(_ s: String) -> Bool {
        if s.isEmpty {return false}
        //        let str = s.trimmingCharacters(in: .whitespaces)
        let chars = Array(s)
        var eSeen = false
        var numSeen = false
        var dotSeen = false
        
        for i in 0..<chars.count {
            let char = chars[i]
            if char.isNumber {
                numSeen = true
            } else if char.lowercased() == "e" {
                if eSeen || !numSeen { //if e is already seen once not valid, exponent cannot present more than once. //we must see a num before, e cannot show first before a number being seen
                    return false
                }
                eSeen = true //first and only time, valid
                numSeen = false //reset because we should be able to see nums again after e
            } else if char == "." {
                if eSeen || dotSeen {
                    return false //dot cannot come after e, dot cannot seen again if its already seen before
                }
                dotSeen = true
            }else if char == "+" || char == "-" {
                if i != 0 && chars[i - 1].lowercased() != "e" {
                    return false //+ , - can only show up at the beginning or right after e
                }
            } else {
                return false
            }
        }
        return numSeen
    }
}
class Q65__Valid_Number: XCTestCase {
    
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
