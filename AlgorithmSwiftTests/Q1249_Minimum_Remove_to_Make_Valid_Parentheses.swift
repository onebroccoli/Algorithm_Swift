//
//  Q1249_Minimum_Remove_to_Make_Valid_Parentheses.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/22/21.
//

import XCTest
private class Solution{
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var invalidPos = [Int]()
        for (i, char) in s.enumerated(){
            if char == "(" {
                stack.append(i)
                continue
            }
            if char == ")"{
                if stack.count == 0 {
                    invalidPos.append(i)
                } else {
                    stack.removeLast()
                }
            }
        }
        invalidPos += stack //combine two arrays, stack has all invalid "("
        invalidPos = Array(invalidPos.sorted().reversed()) //we need to remove the positions in invalidPos later, so has to be sorted and reversed to the same order as string
        var arr = Array(s)
        
        for i in invalidPos {
            arr.remove(at: i)
        }
        return String(arr)
    }
}

class Q1249_Minimum_Remove_to_Make_Valid_Parentheses: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
