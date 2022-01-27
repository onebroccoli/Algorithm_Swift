//
//  Q35_Search_Insert_Position.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/26/22.
//
/*
 35. Search Insert Position
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:

 Input: nums = [1,3,5,6], target = 5
 Output: 2
 Example 2:

 Input: nums = [1,3,5,6], target = 2
 Output: 1
 Example 3:

 Input: nums = [1,3,5,6], target = 7
 Output: 4
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums contains distinct values sorted in ascending order.
 -104 <= target <= 104
 */
import XCTest
private class Solution {
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums == nil || nums.count == 0 {
        return 0
    }
    var left = 0
    var right = nums.count - 1
    while left <= right {
        var mid = left + (right - left) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}
}
class Q35_Search_Insert_Position: XCTestCase {

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
