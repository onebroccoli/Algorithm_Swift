//
//  Q50_Pow(x_n).swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 50. Pow(x, n)

 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

  

 Example 1:

 Input: x = 2.00000, n = 10
 Output: 1024.00000
 Example 2:

 Input: x = 2.10000, n = 3
 Output: 9.26100
 Example 3:

 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
  
 */
import XCTest
private class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var n = n
        var x = x
        if n < 0 {
            x = 1 / x
            n = -n
        }
        return fastPow(x, n)
    }
    
    func fastPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        var half: Double = fastPow(x, n/2)
        if n % 2 == 0 {
            return half * half
        } else {
            return half * half * x
        }
    }
    
}
class Q50_Pow_x_n_: XCTestCase {

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
