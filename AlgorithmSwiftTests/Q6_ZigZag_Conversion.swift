//
//  Q6_ZigZag_Conversion.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/17/21.
//
/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:

 Input: s = "A", numRows = 1
 Output: "A"
  
 */
import XCTest
private class Solution {
func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 || numRows >= s.count {
        return s
    }
    var zigzag = Array(repeating: "", count: numRows)
    var row = 0
    var step = 1
    var chars = Array(s)
    for char in chars {
        zigzag[row].append(char)
        if row == 0 {
            step = 1
        } else if row == numRows - 1{
            step = -1
        }
        row += step
    }
    return zigzag.joined()
}
}
class Q6_ZigZag_Conversion: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
