//
//  Q162_Find_Peak_Element.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/26/22.
//
/*
 162. Find Peak Element

 A peak element is an element that is strictly greater than its neighbors.

 Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

 You may imagine that nums[-1] = nums[n] = -∞.

 You must write an algorithm that runs in O(log n) time.

  

 Example 1:

 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 Example 2:

 Input: nums = [1,2,1,3,5,6,4]
 Output: 5
 Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
  

 Constraints:

 1 <= nums.length <= 1000
 -231 <= nums[i] <= 231 - 1
 nums[i] != nums[i + 1] for all valid i.
 */
import XCTest
private class Solution {
func findPeakElement(_ nums: [Int]) -> Int {
    if nums == nil || nums.count == 0 {
        return -1
    }
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        var mid = left + (right - left) / 2
        if nums[mid] > nums[mid + 1] {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}
}
class Q162_Find_Peak_Element: XCTestCase {

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
