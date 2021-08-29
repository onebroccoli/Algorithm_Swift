//
//  Q66_plus_one.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/20/21.
//
/*
 Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.

  

 Example 1:

 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:

 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Example 3:

 Input: digits = [0]
 Output: [1]
  
 */
import XCTest

private class Solution{
    func plusOne(_ digits : [Int]) -> [Int]{
        var digits = digits
        var index = digits.count - 1
        while index >= 0 {
            if digits[index] < 9 {
                digits[index] += 1
                return digits
            }
            digits[index] = 0
            index -= 1
        }
        digits.insert(1, at: 0)
        return digits
    }
}


class Q66_plus_one: XCTestCase {

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
