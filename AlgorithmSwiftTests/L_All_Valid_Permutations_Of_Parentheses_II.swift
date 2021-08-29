//
//  L_All_Valid_Permutations_Of_Parentheses_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/29/21.
//
/*
 Get all valid permutations of l pairs of (), m pairs of <> and n pairs of {}.
 Assumptions
 l, m, n >= 0
 l + m + n > 0
 Examples
 l = 1, m = 1, n = 0, all the valid permutations are ["()<>", "(<>)", "<()>", "<>()"]



 */
import XCTest
private class Solution {
    let set : [Character] = ["(", ")", "<", ">", "{", "}"]
    func validParentheses(_ l: Int, _ m: Int, _ n: Int) -> [String] {
        //assumption: l, m, n >= 0
        var remain = [l, l, m, m, n, n]
        let targetLen = 2 * (l + m + n)
        let str = ""
        var stack = [Character]()
        var result = [String]()
        helper(str, &stack, &remain, targetLen, &result);
        return result
    }
    func helper(_ str: String, _ stack: inout [Character], _ remain: inout [Int], _ targetLen: Int, _ result: inout [String]){
        //termination condition, when == targetLen, means all the parentheses are used, append to result
        if str.count == targetLen {
            result.append(str)
            return
        }
        for i in 0..<remain.count {
            //case 1: i even number,  when to add the left side""(", "<", "{": i%2 == 0

            if i % 2 == 0 {
                if remain[i] > 0 {
                    let s = str + String(set[i])
                    stack.append(set[i])
                    remain[i] -= 1
                    helper(s,&stack, &remain, targetLen, &result);
                    stack.removeLast();
                    remain[i] += 1
                }
            } else {
                //case 2: i odd number, 1)stack not empty, 2)stack.peekFirst() == set[i - 1]
                
                //if stack.isEmpty == false && String(stack.last) != set[i - 1] {
//                if let stackLast = stack.last {
                if stack.isEmpty == false && String(stack.last!) != String(set[i - 1]) {
                    let s2 = str + String(set[i])
                    stack.removeLast()
                    remain[i] -= 1
                    helper(s2, &stack, &remain, targetLen, &result);
                    stack.append(set[i - 1])
                    remain[i] += 1
                }
                
            }
        }
    }
}

class L_All_Valid_Permutations_Of_Parentheses_II: XCTestCase {



    func testExample() throws {
        let s = Solution()
        let result = s.validParentheses(2,2,2)
        print (result)
    }



}
