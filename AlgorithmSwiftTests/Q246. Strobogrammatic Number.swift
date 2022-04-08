//
//  Q246. Strobogrammatic Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/7/22.
//
/*
 246. Strobogrammatic Number
 Given a string num which represents an integer, return true if num is a strobogrammatic number.

 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

  

 Example 1:

 Input: num = "69"
 Output: true
 Example 2:

 Input: num = "88"
 Output: true
 Example 3:

 Input: num = "962"
 Output: false
  

 Constraints:

 1 <= num.length <= 50
 num consists of only digits.
 num does not contain any leading zeros except for zero itself.
 */
import XCTest
private class Solution {
func isStrobogrammatic(_ num: String) -> Bool {
    var map: [Character : Character] = [:]
    map["6"] = "9"
    map["9"] = "6"
    map["0"] = "0"
    map["1"] = "1"
    map["8"] = "8"
    
    var nums = Array(num)
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let leftCh = nums[left]
        let rightCh = nums[right]
        if map[leftCh] == nil || map[leftCh]! != rightCh {
            return false
        }
        
        left += 1
        right -= 1
    }
    return true
}
}
class Q246__Strobogrammatic_Number: XCTestCase {

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
