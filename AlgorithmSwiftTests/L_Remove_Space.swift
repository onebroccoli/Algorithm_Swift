//
//  L_Remove_Space.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/5/21.
//
/*
 (281). Remove Spaces

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
    //assumption: input is not nil
    if input.count == 0 {
        return input
    }
    var array = Array(input)
    var slow = 0
    //to ignore the current space character:
        //1. ignore all space characters followed by another space character,
        //   so if there are consecutive space characters,
        //   only the first one will be remained.
        //2. ignore the space if it is the first character of the input string
    for fast in 0..<input.count {
        //need to delete when i is space, 2 conditions: 1) i = 0, 2) previous is space
        print("array[Fast] ======", array[fast])
        
        if  array[fast] == " " && (fast==0 || array[fast - 1] == " "){
            print("dont copy fast into slow")
            continue
        }
        array[slow] = array[fast]
        slow += 1
    }
    
    //post-processing: it is possible we have trailing space character at the end
    if slow > 0 && array[slow - 1] == " " {
        slow -= 1
    }
    return String(array[0..<slow])

}
}


class L_Remove_Space: XCTestCase {

    func testMiddle() throws {
        let s = Solution()
        var a = "   he m o"
        let res = s.removeSpaces(a)
        print("==RESULT IS===\(res)")
        XCTAssert(res == "he m o")
    }
    
    func testLeading() throws {
        let s = Solution()
        var a = "     he m o"
        let res = s.removeSpaces(a)
        print("==RESULT IS===",res)
        XCTAssert(res == "he m o")
    }

    func testTrailing() throws {
        let s = Solution()
        var a = "he m o         "
        let res = s.removeSpaces(a)
        print("==RESULT IS===",res)
        XCTAssert(res == "he m o")
    }
    
    func testLeadingOneSpace() throws {
        let s = Solution()
        var a = " he m o"
        let res = s.removeSpaces(a)
        print("==RESULT IS===",res)
        XCTAssert(res == "he m o")
    }

    func testTrailingOneSpace() throws {
        let s = Solution()
        var a = "he m o "
        let res = s.removeSpaces(a)
        print("==RESULT IS===",res)
        XCTAssert(res == "he m o")
    }

    
    func testAll1() throws {
        let s = Solution()
        var a = "    he m  o    "
        let res = s.removeSpaces(a)
        print("==RESULT IS===",res)
        XCTAssert(res == "he m o")
    }
    
    func testAll2() throws {
        let s = Solution()
        var a = " he m o "
        let res = s.removeSpaces(a)
        print("==RESULT IS===",res)
        XCTAssert(res == "he m o")
    }

}
