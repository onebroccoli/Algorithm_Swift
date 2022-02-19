//
//  Q921. Minimum Add to Make Parentheses Valid.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/18/22.
//
/*
 921. Minimum Add to Make Parentheses Valid
 A parentheses string is valid if and only if:

 It is the empty string,
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
 You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.

 For example, if s = "()))", you can insert an opening parenthesis to be "(()))" or a closing parenthesis to be "())))".
 Return the minimum number of moves required to make s valid.

  

 Example 1:

 Input: s = "())"
 Output: 1
 Example 2:

 Input: s = "((("
 Output: 3
  

 Constraints:

 1 <= s.length <= 1000
 s[i] is either '(' or ')'.
 */
import XCTest
private class Solution {
func minAddToMakeValid(_ s: String) -> Int {
    if s == nil || s.count == 0 {
        return 0
    }
    //use stack
    var stack: [Character] = []
    var map: [Character: Character] = [:]
    map[")"] = "("
    
    
    for i in s {
        if stack.isEmpty {
            stack.append(i)
        } else {
            if stack.last == map[i] {
                stack.removeLast()
            } else {
                stack.append(i)
            }
        }
        
    }
    return stack.count
}
}
class Q921__Minimum_Add_to_Make_Parentheses_Valid: XCTestCase {

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
