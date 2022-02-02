//
//  Q287_Find_the_Duplicate_Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/1/22.
//
/*
 287. Find the Duplicate Number
 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

 There is only one repeated number in nums, return this repeated number.

 You must solve the problem without modifying the array nums and uses only constant extra space.

  

 Example 1:

 Input: nums = [1,3,4,2,2]
 Output: 2
 Example 2:

 Input: nums = [3,1,3,4,2]
 Output: 3
  

 Constraints:

 1 <= n <= 105
 nums.length == n + 1
 1 <= nums[i] <= n
 All the integers in nums appear only once except for precisely one integer which appears two or more times.
  

 Follow up:

 How can we prove that at least one duplicate number must exist in nums?
 Can you solve the problem in linear runtime complexity?
 */
import XCTest
private class Solution {
func findDuplicate(_ nums: [Int]) -> Int {
    var left = 1
    var right = nums.count - 1
    var duplicate = -1
    
    while left <= right {
        var mid = left + (right - left) / 2
        //count how many numbers in nums are less than or equal to cur
        var count = 0
        for num in nums {
            if num <= mid {
                count += 1
            }
        }
        if count > mid {
            duplicate = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return duplicate
}
}
class Q287_Find_the_Duplicate_Number: XCTestCase {

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
