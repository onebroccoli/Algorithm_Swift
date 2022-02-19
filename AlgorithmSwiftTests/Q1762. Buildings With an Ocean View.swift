//
//  Q1762. Buildings With an Ocean View.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/17/22.
//
/*
 1762. Buildings With an Ocean View

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
