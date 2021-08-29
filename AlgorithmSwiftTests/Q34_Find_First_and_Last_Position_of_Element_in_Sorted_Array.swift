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
        var begin = 0
        var end = nums.count - 1
        while begin <= end {
            let mid = (begin + end) / 2
            if nums[mid] == target {
                if isFirst {
                    //means we found our lower bound
                    if mid == begin || nums[mid - 1] != target {
                        return mid
                    }
                    //search on the left side for the bound
                    end = mid - 1
                } else {
                    //thsi means we found our upper bound
                    if mid == end || nums[mid + 1] != target{
                        return mid
                    }
                    //search on the right side for the bound
                    begin = mid + 1
                }
                
            } else if nums[mid] > target {
                end = mid - 1
            } else {
                begin = mid + 1
            }
        }
        return -1
    }
}

class Q34_Find_First_and_Last_Position_of_Element_in_Sorted_Array: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let result = s.searchRange([5,7,7,8,8,10], 8)
        let expected = [3,4]
        XCTAssert(result == expected);
    }


}
