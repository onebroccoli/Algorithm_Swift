//
//  Q702_Search_in_a_Sorted_Array_of_Unknown_Size.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/26/21.
//
/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 If target is not found in the array, return [-1, -1].
 You must write an algorithm with O(log n) runtime complexity.
  
 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]

 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]

 Example 3:
 Input: nums = [], target = 0
 Output: [-1,-1]

 */
import XCTest
private class Solution{
func search(_ reader: ArrayReader, _ target: Int) -> Int {
    var left = 0
    var right = 1
    //find the right boundary for binary search
    //extends until we are sure the target is within the [left, right] range
    while reader.get(right) != nil && reader.get(right) < target {
        //1. move left to right
        //2. double right index
        left = right
        right = 2 * right
    }
    return binarySearch(reader, target, left, right)
    
}

func binarySearch(_ reader: ArrayReader, _ target: Int, _ left: Int, _ right: Int) -> Int {
    var left = left
    var right = right
    while left <= right {
        var mid = left + (right - left) / 2
        if reader.get(mid) == nil || reader.get(mid) > target {
            right = mid - 1
        } else if reader.get(mid) < target {
            left = mid + 1
        } else {
            return mid
        }
    }
    return -1
}
}


class Q702_Search_in_a_Sorted_Array_of_Unknown_Size: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
