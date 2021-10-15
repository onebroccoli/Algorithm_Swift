//
//  L_All_Valid_Permutations_Of_Parentheses_III_Priority.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/15/21.
//
/*
 (642). All Valid Permutations Of Parentheses III （Priority)
 Get all valid permutations of l pairs of (), m pairs of <> and n pairs of {}, subject to the priority restriction: {} higher than <> higher than ().

 Assumptions
     l, m, n >= 0
     l + m + n >= 0

 Examples
     l = 1, m = 1, n = 0, all the valid permutations are ["()<>", "<()>", "<>()"].
     l = 2, m = 0, n = 1, all the valid permutations are [“()(){}”, “(){()}”, “(){}()”, “{()()}”, “{()}()”, “{}()()”].



 
 */
import XCTest


private class Solution {
var set = ["(", ")", "<", ">", "{", "}"]
func validParentheses(_ l: Int, _ m: Int, _ n: Int) -> [String] {
    var remain = [l, l, m, m, n, n]
    let targetLen = 2 * (l + m + n)
    var path = [String]()
    var result = [String]()
    var stack = [Int]()
    dfs(&result, &path, &stack, &remain, targetLen)
    return result
}

private func dfs(_ result: inout [String], _ path: inout [String], _ stack: inout [Int], _ remain: inout [Int], _ targetLen: Int) {
    var remain = remain
    //termination condition
    if path.count == targetLen {
        result.append(path.joined())
        return
    }
    
    for i in 0..<remain.count {
        //case 1: i even number,  when to add the left side""(", "<", "{": i%2 == 0
        // consider the priority
        if (i % 2 == 0){
            if (remain[i] > 0 && (stack.isEmpty || stack.last! > i )){
                path.append(set[i])
                stack.append(i)
                remain[i] -= 1
                dfs(&result, &path, &stack, &remain, targetLen)
                path.removeLast()
                stack.removeLast()
                remain[i] += 1
            }
        //case 2: i odd number, 1)stack not empty, 2)stack.peekFirst() == set[i - 1]
        } else {
            if !stack.isEmpty && stack.last! == i - 1 {
                path.append(set[i])
                stack.removeLast()
                remain[i] -= 1
                dfs(&result, &path, &stack, &remain, targetLen)
                path.removeLast()
                stack.append(i - 1)
                remain[i] += 1
            }
        }
    }
}
}



class L_All_Valid_Permutations_Of_Parentheses_III_Priority: XCTestCase {

   

    func testExample() throws {
        let s = Solution()
        let result = s.validParentheses(2, 0, 1)
        print("=====Result: =====: " , result)
    }

   
}
