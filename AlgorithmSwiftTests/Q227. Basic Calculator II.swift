//
//  Q227. Basic Calculator II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/18/22.
//
/*
 227. Basic Calculator II
 Given a string s which represents an expression, evaluate this expression and return its value.

 The integer division should truncate toward zero.

 You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "3+2*2"
 Output: 7
 Example 2:

 Input: s = " 3/2 "
 Output: 1
 Example 3:

 Input: s = " 3+5 / 2 "
 Output: 5
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
 s represents a valid expression.
 All the integers in the expression are non-negative integers in the range [0, 231 - 1].
 The answer is guaranteed to fit in a 32-bit integer.
 */
import XCTest
private class Solution {
//assumption:
//1. no parenthesis
//2. no overflow issue
//summary: / * has higher precedence than + -
func calculate(_ s: String) -> Int {
    let operators: Set<Character> = ["+","-","*","/"]
    let chars = Array(s)
    var result = 0
    var preValue = 0
    var sign: Character = "+"
    var index = 0
    
    while index < chars.count {
        let char = chars[index]
        if char == " " {
            index += 1
            continue
        } else if operators.contains(char) {
            sign = char
        } else {
            var currValue = char.wholeNumberValue!
            while index < chars.count - 1, let digit = chars[index + 1].wholeNumberValue {
                currValue = currValue * 10 + digit  //take care of multi-digit case
                index += 1
            }
            if sign == "+" {
                result += preValue
                preValue = currValue
            } else if sign == "-" {
                result += preValue
                preValue = -currValue
            } else if sign == "*" {
                preValue *= currValue
            } else { //"/"
                preValue /= currValue
            }
        }
        index += 1
        
    }
    result += preValue
    return result
}
}
class Q227__Basic_Calculator_II: XCTestCase {

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
