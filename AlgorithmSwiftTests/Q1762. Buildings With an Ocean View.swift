//
//  Q1762. Buildings With an Ocean View.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/17/22.
//
/*
 1762. Buildings With an Ocean View
 There are n buildings in a line. You are given an integer array heights of size n that represents the heights of the buildings in the line.

 The ocean is to the right of the buildings. A building has an ocean view if the building can see the ocean without obstructions. Formally, a building has an ocean view if all the buildings to its right have a smaller height.

 Return a list of indices (0-indexed) of buildings that have an ocean view, sorted in increasing order.

  

 Example 1:

 Input: heights = [4,2,3,1]
 Output: [0,2,3]
 Explanation: Building 1 (0-indexed) does not have an ocean view because building 2 is taller.
 Example 2:

 Input: heights = [4,3,2,1]
 Output: [0,1,2,3]
 Explanation: All the buildings have an ocean view.
 Example 3:

 Input: heights = [1,3,2,4]
 Output: [3]
 Explanation: Only building 3 has an ocean view.
  

 Constraints:

 1 <= heights.length <= 105
 1 <= heights[i] <= 109
 */
import XCTest
private class Solution {
    
    func findBuildings(_ heights: [Int]) -> [Int] {
        var i = heights.count - 1
        var result: [Int] = []
        var maxHeight = Int.min
        while i >= 0 {
            if heights[i] > maxHeight {
                maxHeight = heights[i]
                result.insert(i, at: 0)
                
            }
            i -= 1
        }
        
        return result
    }
}
class Q1762__Buildings_With_an_Ocean_View: XCTestCase {

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
