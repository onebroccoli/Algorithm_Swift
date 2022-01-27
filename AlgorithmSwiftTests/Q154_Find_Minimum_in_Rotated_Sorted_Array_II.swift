//
//  Q154_Find_Minimum_in_Rotated_Sorted_Array_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/26/22.
//
/*
 154. Find Minimum in Rotated Sorted Array II (duplicate)
 Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,4,4,5,6,7] might become:

 [4,5,6,7,0,1,4] if it was rotated 4 times.
 [0,1,4,4,5,6,7] if it was rotated 7 times.
 Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

 Given the sorted rotated array nums that may contain duplicates, return the minimum element of this array.

 You must decrease the overall operation steps as much as possible.

  

 Example 1:

 Input: nums = [1,3,5]
 Output: 1
 Example 2:

 Input: nums = [2,2,2,0,1]
 Output: 0
  

 Constraints:

 n == nums.length
 1 <= n <= 5000
 -5000 <= nums[i] <= 5000
 nums is sorted and rotated between 1 and n times.
  

 Follow up: This problem is similar to Find Minimum in Rotated Sorted Array, but nums may contain duplicates. Would this affect the runtime complexity? How and why?
 */
import XCTest
private class Solution {
func findMin(_ nums: [Int]) -> Int {
    //corner cases
    if nums == nil || nums.count == 0 {
        return -1
    }
    if nums.count == 1 {
        return nums[0]
    }
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        var mid = left + (right - left) / 2
        if nums[mid] < nums[right] {
            right = mid
        } else if nums[mid] > nums[right] {
            left = mid + 1
        } else {
            right -= 1
        }
    }
    return nums[left]
    
}
}
class Q154_Find_Minimum_in_Rotated_Sorted_Array_II: XCTestCase {

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
