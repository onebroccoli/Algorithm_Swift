//
//  F. count duplicate in sorted array.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 fb: count duplicate elements in sorted array
 eg. [0,0, 1,2]
 output: 1 (0)
 
 eg. [0,0,1,1,1,2]
 output:2 (0,1)
 */
import XCTest
private class Solution {
    func countDuplicates(_ nums:  [Int]) -> Int {
        if nums == nil || nums.count <= 1 {
            return 0
        }
        var left = 0
        var right = 1
        var count = 0
        var dup = Int.min
        while right < nums.count {
            if nums[left] == nums[right] {
                if nums[left] != dup {
                    dup = nums[left]
                    count += 1
                }
                right += 1
            } else {
                left = right
                right += 1
            }
        }
        return count
    }
}
class F__count_duplicate_in_sorted_array: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let num = [1,1,2,3,4,4]
        let result = s.countDuplicates(num)
        print("Result ====: ", result)
    }



}
