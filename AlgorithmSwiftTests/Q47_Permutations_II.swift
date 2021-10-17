//
//  Q47_Permutations_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/30/21.
//
/*
 Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

  

 Example 1:

 Input: nums = [1,1,2]
 Output:
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 Example 2:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 */
import XCTest
private class Solution {
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    let nums = nums.sorted()
    //sanity check
    if nums.count == 0 {
        return result
    }
    dfs(nums, 0, &result)
    return result
}

func dfs(_ nums: [Int], _ index: Int, _ result: inout [[Int]]) {
    //terminate condition
    if index == nums.count - 1 {
        result.append(nums)
        return
    }
    
    var nums = nums
    for i in index..<nums.count {
        if i == index || nums[i] != nums[index] {
            nums.swapAt(index, i)
            dfs(nums, index + 1, &result)
            
        }
        
    }
}
}


class Q47_Permutations_II: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.permuteUnique([2,2,3])
        print (result)
    }


}
