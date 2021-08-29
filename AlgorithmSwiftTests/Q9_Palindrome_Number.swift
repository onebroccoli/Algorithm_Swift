//
//  Q9_Palindrome_Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/23/21.
//

import XCTest
/*
 
 9. Palindrome Number
 Given an integer x, return true if x is palindrome integer.

 An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

  

 Example 1:

 Input: x = 121
 Output: true
 Example 2:

 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:

 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 Example 4:

 Input: x = -101
 Output: false
  

 Constraints:

 -231 <= x <= 231 - 1
  

 Follow up: Could you solve it without converting the integer to a string?
 */

private class Solution{
    func isPalindrome(_ x: Int) -> Bool {
        var x = x
        if x == 0 {
            return true
        }
        if x < 0 || (x % 10 == 0 && x != 0){
            return false
        }
        var revertedNumber = 0
        while x > revertedNumber{
            revertedNumber = revertedNumber * 10 + x % 10
            x /= 10
        }
        
        return x == revertedNumber || x == revertedNumber / 10
    }
}
class Q9_Palindrome_Number: XCTestCase {

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
