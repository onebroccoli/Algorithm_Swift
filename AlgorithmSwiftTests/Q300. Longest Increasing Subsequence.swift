//
//  Q300. Longest Increasing Subsequence.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/1/22.
//
/*
 300. Longest Increasing Subsequence

 Given an integer array nums, return the length of the longest strictly increasing subsequence.

 A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].

  

 Example 1:

 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Example 2:

 Input: nums = [0,1,0,3,2,3]
 Output: 4
 Example 3:

 Input: nums = [7,7,7,7,7,7,7]
 Output: 1
  

 Constraints:

 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104
  

 Follow up: Can you come up with an algorithm that runs in O(n log(n)) time complexity?
 */
import XCTest
private class Solution {
func lengthOfLIS(_ nums: [Int]) -> Int {
    var res: [Int] = [Int]()
    res.append(nums[0])
    
    for i in 1..<nums.count {
        var num = nums[i]
        if num > res[res.count - 1] {
            res.append(num)
        } else {
            var insertIndex = binarySearch(res, num)
            res[insertIndex] = num
        }
    }
    return res.count
}


func binarySearch(_ nums:[Int], _ num: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        var mid = left + (right - left) / 2
        if nums[mid] == num {
            return mid
        } else if nums[mid] < num {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}
}
class Q300__Longest_Increasing_Subsequence: XCTestCase {

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
