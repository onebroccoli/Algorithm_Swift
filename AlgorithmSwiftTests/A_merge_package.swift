//
//  A_merge_package.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/5/22.
//
/*
 merge
 */

import XCTest
private class Solution {
    func merge(_ nums: [Int]) -> Int {
        var stack: [Int] = []
        stack.append(nums[0])
        for i in 1..<nums.count {
            if stack.last! < nums[i] {
                var temp = stack.last! + nums[i]
                stack.popLast()
                stack.append(temp)
            }
        }
        while !stack.isEmpty {
            guard var last = stack.popLast() else { return 0 }
            if stack.isEmpty {
                return 1
            } else {
                if last > stack.last! {
                    guard var secondLast = stack.popLast() else { return stack.count }
                    var temp = last + secondLast
                    stack.append(temp)
                } else {
                    return stack.count
                }
            }
        }
        return stack.count
    }
    
}
class A_merge_package: XCTestCase {
    
  
    func testExample() throws {
        let s = Solution()
        let a = [10,20,30,12,20]
        let result = s.merge(a)
        print("resutl ==== ", result)
    }

   

}
