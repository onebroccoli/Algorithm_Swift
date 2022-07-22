//
//  Q224. Basic Calculator.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/21/22.
//
/*
 224. Basic Calculator
 Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "1 + 1"
 Output: 2
 Example 2:

 Input: s = " 2-1 + 2 "
 Output: 3
 Example 3:

 Input: s = "(1+(4+5+2)-3)+(6+8)"
 Output: 23
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of digits, '+', '-', '(', ')', and ' '.
 s represents a valid expression.
 '+' is not used as a unary operation (i.e., "+1" and "+(2 + 3)" is invalid).
 '-' could be used as a unary operation (i.e., "-1" and "-(2 + 3)" is valid).
 There will be no two consecutive operators in the input.
 Every number and running calculation will fit in a signed 32-bit integer.
 */
import XCTest
private class Solution {
func calculate(_ s: String) -> Int {
    var num = 0
    var result = 0
    var sign = 1
    var stack = [Int]()
    var s = Array(s)
    for i in 0..<s.count {
        var c = s[i]
        if c == "+" {
            result += sign * num
            num = 0
            sign = 1
        } else if c == "-" {
            result += sign * num
            num = 0
            sign = -1
        } else if c == "(" {
            stack.append(result)
            stack.append(sign)
            result = 0
            sign = 1
            
        } else if c == ")"{
            result += sign * num
            num = 0
            result *= stack.removeLast()
            result += stack.removeLast()
            
        } else {
            if let n = Int(String(c)) {
                num = 10 * num + n
            }
        }
    }
    if num != 0 {
        result += sign * num
    }
    return result
}
    
}
class Q224__Basic_Calculator: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        let a = "(120-(4+5)+3)"
        let res = s.calculate(a)
        print("result ==== ", res)
    }


}
