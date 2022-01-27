//
//  Q81_Search_in_Rotated_Sorted_Array_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/26/22.
//
/*
 81. Search in Rotated Sorted Array II

 There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).
 Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].
 Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.
 You must decrease the overall operation steps as much as possible.
  
 Example 1:
 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true

 Example 2:
 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false


 */
import XCTest
private class Solution {
func search(_ nums: [Int], _ target: Int) -> Bool {
    if nums == nil || nums.count == 0 {
        return false
    }
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        //avoid duplicates
        while left < right && nums[left] == nums[left + 1] {
            left += 1
        }
        while left < right && nums[right] == nums[right - 1] {
            right -= 1
        }
        var mid = left + (right - left) / 2
        if nums[mid] == target {
            return true
        } else if nums[mid] >= nums[left] {
            if target >= nums[left] && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
            
        }else {
            if target <= nums[right] && target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
    }
    return false
}
}
class Q81_Search_in_Rotated_Sorted_Array_II: XCTestCase {

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
