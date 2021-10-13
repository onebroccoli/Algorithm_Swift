//
//  Q90_Subsets_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/29/21.
//
/*
 Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,2]
 Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
*/

import XCTest
private class Solution {
func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var path = [Int]()
    //make sure the multi-set is sorted so that we can deduplicate.
    let nums = nums.sorted(by: <)
    helper(&res, &path, nums, 0)

    return res
}
//index: at current level, determine if the element at "index" should be included in the subset or not
private func helper(_ res: inout [[Int]],  _ path: inout [Int], _ nums: [Int], _ index:  Int) {
    var index = index
    // termination case
    if index == nums.count {
        res.append(path)
        return
    }
    //case1: add
    path.append(nums[index])
    helper(&res, &path, nums, index + 1)
    path.removeLast()

    //case2: //case2: not add when duplicates
    //skip all the consecutive and duplicate elements
    while index < nums.count - 1 && nums[index + 1] == nums[index] {
        index += 1
    }
    helper(&res, &path, nums, index + 1)
}

}

class Q90_Subsets_II: XCTestCase {
    func testExample() throws {
        let s = Solution()
        let result = s.subsetsWithDup([2,2,2,2,3])
        print (result)
    }
    

}
