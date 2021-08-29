//
//  Q18_KSum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/19/21.
//

import XCTest

private class Solution{
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]]{
        let nums = nums.sorted()
        return kSum(nums, target, 0, 4)
    }
    
    private func kSum(_ nums: [Int], _ target: Int, _ start: Int, _ k: Int) -> [[Int]]{
        var result = [[Int]]()
        //sanity check
        //1.start == nums.count means start is past end of nums, return empty result
        //2.because nums is sorted, nums[start] * k > target means you will always overshoot the target
        //3.because the last element in nums * k is still smaller than target, so you always undershoot the target
        if start == nums.count || nums[start] * k > target || target > nums[nums.count - 1] * k {
            return result
        }
        //base case: two sum
        if k == 2 {
            return twoSum(nums, target, start)
        }
        //iterate through the nums,
        
        for i in start..<nums.count {
            //nums is sorted. we need to avoid duplicate answers by avoiding starting with a nums[i] that has already been seen. if there is no previous(= start), just go ahead becauses there is no risk for a duplicate.
            if (i == start || nums[i - 1] != nums[i]){
                for set in kSum(nums, target - nums[i], i + 1, k - 1) {
                    result.append(set + [nums[i]]);
                }
            }
        }
        return result
    }
    
    
    private func twoSum(_ nums:[Int], _ target: Int, _ start: Int) -> [[Int]]{
        var result = [[Int]]()
        var left = start
        var right = nums.count - 1
        while left < right {
            let sum = nums[left] + nums[right]
            if (sum < target) || (left > start && nums[left] == nums[left - 1]){
                left += 1
            } else if (sum > target) || (right < nums.count - 1 && nums[right] == nums[right + 1]){
                right -= 1
            } else {
                result.append( [nums[left], nums[right]])
                left += 1
                right -= 1
            }
        }
        return result
    }
}





class Q18_KSum: XCTestCase {

    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let s = Solution()
        let result = s.fourSum([1,0,-1,0,-2,2], 0)
        let expected = [[1, 2, -1, -2], [0, 2, 0, -2], [0, 1, 0, -1]];
        XCTAssert(result == expected);
    }
    

}
