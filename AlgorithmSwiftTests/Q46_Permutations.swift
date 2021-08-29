//
//  Q46_Permutations.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/28/21.
//
/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:

 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:

 Input: nums = [1]
 Output: [[1]]
  

 Constraints:

 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */
import XCTest

private class Solution {
    func permute(_ nums: [Int]) -> [[Int]]{
        var result = [[Int]]()
        //sanity check
        if nums.count == 0 {
            return result
        }
        //choose the character to be at the position of "Index"
          //all the already chosen positions are (0, index - 1)
          //all the candidate characters can be at position "index"
          //are in the subarray of (index, array.length-1)
        var array = nums
        dfs(&array, 0, &result)
        return result
    }
    func dfs(_ nums: inout [Int], _ index: Int, _ result: inout [[Int]]){
        //terminate condition:
        //only when we have already chosen the characters for all the positions,
        //we can have a complete permutation
        if index == nums.count - 1 {
            result.append(nums)
            return
        }
        //all the possible numbers could be placed at index are
        //the numbers in the subarray (index, nums.length-1)
        for i in index..<nums.count {
            swap(&nums, index, i)
            dfs(&nums, index + 1, &result)
            //remember to swap back when back track to previou level
            swap(&nums, index, i)

        }
    }
    
    //swap function
    func swap(_ nums: inout [Int], _ left: Int, _ right: Int) {
        let tmp = nums[left]
        nums[left] = nums[right]
        nums[right] = tmp
    }
}


class Q46_Permutations: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.permute([1,2,3])
        print (result)
    }



}
