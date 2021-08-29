//
//  Q20_Valid_Parentheses.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/29/21.
//
/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 Example 4:

 Input: s = "([)]"
 Output: false
 Example 5:

 Input: s = "{[]}"
 Output: true
  

 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */


import XCTest
private class Solution {
    let map: [Character : Character] = [
        "}": "{",
        ")": "(",
        "]": "["]
    
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            let c = map[char]
            if c == nil {
                stack.append(char)
            } else {
                if stack.popLast() != c {
                    return false
                }
            }
        }
        return stack.count == 0
    }
    
    static func getSolution() -> Void {
        print(Solution().isValid("(("))//false
        print(Solution().isValid("(])"))//false
        print(Solution().isValid("([{}])"))//true
        print(Solution().isValid("()[]{}"))//true
        print(Solution().isValid("([{)]}"))//false
    }
}



class Q20_Valid_Parentheses: XCTestCase {


    func testExample() throws {
        print(Solution().isValid("(("))//false
        print(Solution().isValid("(])"))//false
        print(Solution().isValid("([{}])"))//true
        print(Solution().isValid("()[]{}"))//true
        print(Solution().isValid("([{)]}"))//false
    }


}
