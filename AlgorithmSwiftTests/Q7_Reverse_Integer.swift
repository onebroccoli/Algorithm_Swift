//
//  Q7_Reverse_Integer.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/12/21.
//
/*
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
 Example 4:

 Input: x = 0
 Output: 0
  

 Constraints:

 -231 <= x <= 231 - 1
 */
import XCTest
private class Solution {
func reverse(_ x: Int) -> Int {
    var  x = x
    var reversedX = 0
    while x != 0 {
        reversedX = reversedX * 10 + x % 10
        x /= 10
        if (reversedX < 0 && x != 0 && Int(Int32.min) / 10 > reversedX) {
            return 0
        }
        if (reversedX > 0 && x != 0 && Int(Int32.max) / 10 < reversedX) {
            return 0
        }
    }
    return reversedX
    
    
}

}


class Q7_Reverse_Integer: XCTestCase {

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
