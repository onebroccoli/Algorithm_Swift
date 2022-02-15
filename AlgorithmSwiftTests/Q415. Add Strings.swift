//
//  Q415. Add Strings.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/14/22.
//
/*
 415. Add Strings
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

  

 Example 1:

 Input: num1 = "11", num2 = "123"
 Output: "134"
 Example 2:

 Input: num1 = "456", num2 = "77"
 Output: "533"
 Example 3:

 Input: num1 = "0", num2 = "0"
 Output: "0"
  

 Constraints:

 1 <= num1.length, num2.length <= 104
 num1 and num2 consist of only digits.
 num1 and num2 don't have any leading zeros except for the zero itself.
 */
import XCTest
private class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let chars1: [Character] = Array(num1).reversed()
        let chars2: [Character] = Array(num2).reversed()
        var carry = 0
        var res = [Character]()
        var l1 = 0
        var l2 = 0
        while l1 < chars1.count || l2 < chars2.count || carry == 1{
            let char1 = l1 < chars1.count ? Int(String(chars1[l1]))! : 0
            let char2 = l2 < chars2.count ? Int(String(chars2[l2]))! : 0
            var value = (char1 + char2 + carry) % 10
            carry = (char1 + char2 + carry) / 10
            l1 += 1
            l2 += 1
            res.append(Character(String(value)))
            
            
        }
        return String(res.reversed())
    }
    
}
class Q415__Add_Strings: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
