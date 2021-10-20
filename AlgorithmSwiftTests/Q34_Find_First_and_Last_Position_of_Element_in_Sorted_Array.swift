//
//  Q34_Find_First_and_Last_Position_of_Element_in_Sorted_Array.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/27/21.
//

import XCTest
private class Solution {
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let firstOccurrence = findBound(nums, target, true)
    if (firstOccurrence == -1){
        return [-1, -1]
    }
    let lastOccurrence = findBound(nums, target, false)
    return [firstOccurrence, lastOccurrence]
}
func findBound(_ nums: [Int], _ target: Int, _ isFirst: Bool) -> Int {
    var left = 0
    var right = nums.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            //isFirst = true: find lower bound
            if isFirst {
                //case1.1: mid is at beginning
                //case1.2: left of mid != target
                if mid == left || nums[mid - 1] != target {
                    return mid
                }
                right = mid - 1 //search for left side for the bound
            } else {
            //isFirst = false : find upper bound
                if mid == right || nums[mid + 1] != target {
                    return mid
                }
                left = mid + 1 //search for the right side for the bound
            }
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}
    

}

class Q34_Find_First_and_Last_Position_of_Element_in_Sorted_Array: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let result = s.searchRange([5,7,7,8,8,10], 8)
        print ("RESULT:========", result)
        let expected = [3,4]
        XCTAssert(result == expected);
    }


}
