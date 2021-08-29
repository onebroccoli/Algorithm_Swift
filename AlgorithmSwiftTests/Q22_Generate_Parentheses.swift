//
//  Q22_Generate_Parentheses.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/28/21.
//
/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

  

 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]

 */
import XCTest

private class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        let str = ""
        dfs(n, 0, 0, str, &result)
        return result
    }
    func dfs(_ n: Int, _ left: Int, _ right: Int, _ str: String, _ result: inout [String]) {
        if left == n && right == n {
            result.append(str)
            return
        }
        if left < n {
            let s = str + "("
            print (s)
            dfs(n, left + 1,right,  s, &result)
        }
        if (left > right){
            let s = str + ")"
            print (s)
            dfs(n, left, right + 1, s, &result)
        }
    }
}

class Q22_Generate_Parentheses: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.generateParenthesis(3)
        print (result)
//        let expected = [[],[1],[1,2],[1,2,3],[1,3],[2],[2,3],[3]]
//        XCTAssert(result == expected);
    }

}
