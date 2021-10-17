//
//  L_Two_Subsets_with_Min_Difference.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/30/21.
//
/*
 Given a set of n integers, divide the set in two subsets of n/2 sizes each such that the difference of the sum of two subsets is as minimum as possible.

 Return the minimum difference(absolute value).

 Assumptions:

 The given integer array is not null and it has length of >= 2.
 Examples:

 {1, 3, 2} can be divided into {1, 2} and {3}, the minimum difference is 0
  
 
 */
import XCTest
private class Solution {
    func minDifference(_ array: [Int]) -> Int {
        let n = array.count
        if n == 2 {
            return abs(array[0] - array[1])
        }
        let totalSum = findSum(array)
        print (totalSum)
        var minDiff: [Int] = [Int.max]
        dfs(array, totalSum, &minDiff, 0, 0, 0)
        return minDiff[0]
    }
    func dfs(_ array: [Int], _ totalSum: Int, _ minDiff: inout [Int], _ index: Int, _ count: Int, _ curSum: Int){
        //termination condition
        if count == array.count / 2 {
            minDiff[0] = min(minDiff[0], abs(curSum - (totalSum - curSum)))
            return
        }
        if index == array.count {
            return
        }
        //case1: add into subset
        dfs(array, totalSum, &minDiff, index + 1, count + 1, curSum + array[index])
        //case2: not add into subset
        dfs(array, totalSum, &minDiff, index + 1, count, curSum)
    }
    
    func findSum(_ array: [Int]) -> Int {
        var sum = 0
        for i in 0..<array.count{
            sum += array[i]
        }
        return sum
    }
}
class L_Two_Subsets_with_Min_Difference: XCTestCase {

    func testExample() throws {
        let s = Solution()
//        let result = s.minDifference([1,1,1,3])
        let result = s.minDifference([1,2,3])

        print("~~~~~~~~~~~~RESULT:")
        print (result)
    }


}
