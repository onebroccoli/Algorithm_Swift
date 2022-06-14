//
//  Q150. Evaluate Reverse Polish Notation.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 6/13/22.
//
/*
 150. Evaluate Reverse Polish Notation
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.

 Valid operators are +, -, *, and /. Each operand may be an integer or another expression.

 Note that division between two integers should truncate toward zero.

 It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

  

 Example 1:

 Input: tokens = ["2","1","+","3","*"]
 Output: 9
 Explanation: ((2 + 1) * 3) = 9
 Example 2:

 Input: tokens = ["4","13","5","/","+"]
 Output: 6
 Explanation: (4 + (13 / 5)) = 6
 Example 3:

 Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
 Output: 22
 Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22
  

 Constraints:

 1 <= tokens.length <= 104
 tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].
 */
import XCTest
private class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        if tokens.count == 0 || tokens.isEmpty {
            return 0
        }
        
        var stack: [Int] = []
        for i in tokens {
            //if can be parsed, then it's number
            if let parsed = Int(i) {
                stack.insert(parsed, at:0)
            }
            else {
                let operand = i
                let num1 = stack.remove(at:0)// stack.remove(at: 0)
                let num2 = stack.remove(at:0)
                
                stack.insert(calculate(num1,num2,operand), at: 0)
            }
        }
        return stack.remove(at:0)
    }
    
    
    func calculate(_ n1: Int, _ n2: Int, _ operant: String) -> Int {
        if operant == "+" {
            return n1 + n2
        }
        else if operant == "-" {
            return n2 - n1
        }
        else if operant == "*" {
            return n1 * n2
        }
        else if operant == "/" {//notice the division needs to be n2/n1
            return n2 / n1
        }
        return 0
    }
            
    //use switch
func evalRPN2(_ tokens: [String]) -> Int {
    if tokens.count == 0 || tokens.isEmpty {
        return 0
    }
    
    var stack: [Int] = []
    for i in tokens {
        if let parsed = Int(i) {
            stack.insert(parsed,  at:0)
            
        } else {
            let num1 = stack.remove(at:0)
            let num2 = stack.remove(at: 0)
            var total = 0
            
            switch(i) {
            case "+":
                total = num1 + num2
            case "-":
                total = num2 - num1
            case "*":
                total = num1 * num2
            case "/":
                total = num2 / num1
            default:
                print("Incorrect token")
            }
            stack.insert(total, at:0)
        }
        
        
    }
    return stack.remove(at: 0)
}

                    
                    
                    
}
class Q150__Evaluate_Reverse_Polish_Notation: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let a = ["4","13","5","/","+"]
        var result = s.evalRPN2(a)//return 2
        print ("result : == ",result)
    }

   

}
