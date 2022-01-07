//
//  Q69_Sqrt(x).swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/5/22.
//
/*
 Given a non-negative integer x, compute and return the square root of x.

 Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

 Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.

  

 Example 1:

 Input: x = 4
 Output: 2
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
 */
import XCTest
private class Solution {
func mySqrt(_ x: Int) -> Int {
    if x < 2 {
        return x
    }
    var left = 2
    var right = x / 2
    while left <= right {
        var mid = left + (right - left) / 2
        var num = mid * mid
        if num > x {
            right = mid - 1
        } else if num < x {
            left = mid + 1
        } else if num == x {
            return mid
        }
    }
    return right
            
        
    }
}
class Q69_Sqrt_x_: XCTestCase {

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
