//
//  L_Remove_Spaces.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/11/21.
//
/*
 Given a string, remove all leading/trailing/duplicated empty spaces.

 Assumptions:

 The given string is not null.
 Examples:

 “  a” --> “a”
 “   I     love MTV ” --> “I love MTV”
 */
import XCTest
private class Solution {
    func removeSpaces(_ input: String) -> String {
        if input.isEmpty {
            return input
        }
        var array = Array(input)
        var slow = 0
        for i in 0..<array.count {
            if (array[i] == " " && (i == 0 || array[i - 1] == " ")) {
                continue
            }
            array[slow] = array[i]
            slow += 1
        }
        //post-processing: it is possible we have trailing space character at the end
        if slow > 0 && array[slow - 1] == " "{
            slow -= 1
        }
        return String(array[0..<slow + 1])
    }
}

class L_Remove_Spaces: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.removeSpaces(" I love  String")
        print ("result is :" , result)
    }


}
