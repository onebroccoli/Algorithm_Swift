//
//  Q31. Next Permutation.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/16/22.
//
/*
 31. Next Permutation

 */
import XCTest
private class Solution {
func nextPermutation(_ nums: inout [Int]) {
    var i = nums.count - 2
    while i >= 0 && nums[i] >= nums[i + 1] { // find the first decreasing element from right
        i -= 1
        
    }
    //find the number just greater than the element found above
    if i >= 0 {
        var j = nums.count - 1
        while nums[j] <= nums[i] {
            j -= 1
        }
        swap(&nums, i, j)
    }
    reverse(&nums, i+1 ) //reverse the element after a[i] to ascending order
}

func reverse(_ nums: inout [Int], _ start: Int)  {
    var i = start, j = nums.count - 1
    while i < j {
        swap(&nums, i, j)
        i += 1
        j -= 1
    }
}

func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    var temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}
}
class Q31__Next_Permutation: XCTestCase {

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
