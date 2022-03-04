//
//  Q605. Can Place Flowers.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/3/22.
//
/*
 605. Can Place Flowers
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  

 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:

 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length
 */
import XCTest
private class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var cnt = flowerbed.count
        if cnt < n {
            return false
        }
        if cnt % 2 == 0 && cnt/2 < n {
            return false
        } else if cnt%2 == 1&& cnt /2 + 1 < n {
            return false
        }
        
        
    }
}
class Q605__Can_Place_Flowers: XCTestCase {

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
