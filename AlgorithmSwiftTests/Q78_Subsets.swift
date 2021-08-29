//
//  Q78_Subsets.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/28/21.
//
/*
 Given an integer array nums of unique elements, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  

 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 All the numbers of nums are unique.
 */
import XCTest
private class Solution{
    func subsets(nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        //            let nums = nums.sorted(by: <)
        
        dfs(&res, &path, nums, 0)
        
        return res
    }
    
    private func dfs(_ res: inout [[Int]],  _ path: inout [Int], _ nums: [Int], _ index: Int) {
        // termination case
        res.append(path)
        
        for i in index..<nums.count {
            path.append(nums[i])
            dfs(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}



class Q78_Subsets: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.subsets(nums: [1,2,3])
        print (result)
        let expected = [[],[1],[1,2],[1,2,3],[1,3],[2],[2,3],[3]]
        XCTAssert(result == expected);
    }

}
