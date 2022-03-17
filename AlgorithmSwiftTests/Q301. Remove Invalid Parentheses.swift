//
//  Q301. Remove Invalid Parentheses.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/14/22.
//
/*
 301. Remove Invalid Parentheses
 Given a string s that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.
 Return all the possible results. You may return the answer in any order.
  
 Example 1:
 Input: s = "()())()"
 Output: ["(())()","()()()"]

 Example 2:
 Input: s = "(a)())()"
 Output: ["(a())()","(a)()()"]

 Example 3:
 Input: s = ")("
 Output: [""]

  
 Constraints:
 1 <= s.length <= 25
 s consists of lowercase English letters and parentheses '(' and ')'.
 There will be at most 20 parentheses in s.

 Since we don't know which of the brackets can possibly be removed, we try out all the options!
 We can use recursion to try out all possibilities for the given expression. For each of the brackets, we have 2 options:
 We keep the bracket and add it to the expression that we are building on the fly during recursion.
 OR, we can discard the bracket and move on.
 The one thing all these valid expressions have in common is that they will all be of the same length i.e. as compared to the original expression, all of these expressions will have the same number of characters removed. Can we somehow find the number of misplaced parentheses and use it in our solution?
 For every left parenthesis, we should have a corresponding right parenthesis. We can make use of two counters which keep track of misplaced left and right parenthesis and in one iteration we can find out these two values.
 0 1 2 3 4 5 6 7
 ( ) ) ) ( ( ( )
 i = 0, left = 1, right = 0
 i = 1, left = 0, right = 0
 i = 2, left = 0, right = 1
 i = 3, left = 0, right = 2
 i = 4, left = 1, right = 2
 i = 5, left = 2, right = 2
 i = 6, left = 3, right = 2
 i = 7, left = 2, right = 2

 */
import XCTest
private class Solution {
    //Since we just need to find "minimum" number of invalid parentheses, we do BFS for the string (use string length to represent the level here). When the level becomes smaller than length of our previous results, we can stop.
    //prevent a large amount of duplicate searching, we need to skip those visited to prevent them from going deeper
    
    func removeInvalidParentheses(_ s: String) -> [String] {
        var result = Set<String>()
        var queue = [s]
        var visited = Set<String>()
        while queue.count > 0 {
            let curr = queue.removeFirst()
            if let first = result.first, first.count > curr.count {
                break
            }
            if isValid(curr) {
                result.insert(curr)
            } else {
                let toRemove = charToRemove(curr) //which side "(" or ")" to remove
                for i in curr.indices where curr[i] == toRemove {
                    let next = String(curr[curr.startIndex..<i] + curr[curr.index(after: i)...])
                    if !visited.contains(next) {
                        queue.append(next)
                        visited.insert(next)
                    }
                }
                
            }
        }
        return Array(result)
        
    }
    
    func isValid(_ s: String) -> Bool {
        var l = 0
        for char in s {
            if char == "(" {
                l += 1
            } else if char == ")" {
                l -= 1
            }
            if l < 0 {
                return false
            }
        }
        return l == 0
    }
    
    func charToRemove(_ s: String) -> Character {
        var l = 0 , r = 0
        for char in s {
            if char == "(" {
                l += 1
            } else if char == ")" {
                r += 1
            }
        }
        return l > r ? "(" : ")"
    }
}
class Q301__Remove_Invalid_Parentheses: XCTestCase {


    func testExample() throws {
       let s = Solution()
        let a = "()())()" //["(())()","()()()"]
        let res = s.removeInvalidParentheses(a)
        print("RESULT: == ", res)
    }

  
}
