//
//  Q167_Two_Sum_II_Input_Array_Is_Sorted.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/26/22.
//
/*
 167. Two Sum II - Input Array Is Sorted
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

 The tests are generated such that there is exactly one solution. You may not use the same element twice.

  

 Example 1:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 Example 2:

 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
 Example 3:

 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].
  
 */
import XCTest
private class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers == nil || numbers.count == 0 || numbers.count == 1 {
            return  [-1, -1]
        }
        var result: [Int] = [Int]()
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            var mid = left + (right - left) / 2
            var sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left = ((numbers[mid] + numbers[right]) < target) ? mid : left + 1
            } else {
                right = ((numbers[mid] + numbers[left]) > target) ? mid : right - 1
            }
        }
        return [-1, -1]
    }
    
    
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    if numbers == nil || numbers.count == 0 || numbers.count == 1 {
        return  [-1, -1]
    }
    var left = 0
    var right = numbers.count - 1
    
    
    while left < right {
        var sum = numbers[left] + numbers[right]
        if sum > target {
            right -= 1
        } else if sum < target {
            left += 1
        } else {
            return [left + 1, right + 1]
        }
        
    }
    return [-1, -1]
}
}
class Q167_Two_Sum_II_Input_Array_Is_Sorted: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let a = [2,7, 11, 15]
        var result = s.twoSum(a, 9)
        print(result)
    }

}
