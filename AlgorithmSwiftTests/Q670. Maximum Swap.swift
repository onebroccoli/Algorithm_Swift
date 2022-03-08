//
//  Q670. Maximum Swap.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/7/22.
//
/*
 670. Maximum Swap

 You are given an integer num. You can swap two digits at most once to get the maximum valued number.

 Return the maximum valued number you can get.

  

 Example 1:

 Input: num = 2736
 Output: 7236
 Explanation: Swap the number 2 and the number 7.
 Example 2:

 Input: num = 9973
 Output: 9973
 Explanation: No swap.
  

 Constraints:

 0 <= num <= 108
 */
import XCTest
private class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var digits: [Int] = []
        var num = num
        var result = 0
        
        //turn number into digits
        while num > 0 {
            digits.insert(num%10, at: 0)
            num /= 10
        }
        
        //find possible swap
        for i in 0..<digits.count - 1{
            var max = i
            for j in i+1..<digits.count {
                if digits[j] >= digits[max] {
                    max = j
                }
            }
            if digits[max] != digits[i] {
                var temp = digits[i]
                digits[i] = digits[max]
                digits[max] = temp
                break
            }
            //return num if no swap was found
            if i == digits.count - 1 {
                return num
            }
            
        }
            
            //turn array back into number
        var size = digits.count - 1
        for digit in digits {
            result += digit * Int(pow(Double(10), Double(size)))
            size -= 1
        }
        return result
    }
}
class Q670__Maximum_Swap: XCTestCase {

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
