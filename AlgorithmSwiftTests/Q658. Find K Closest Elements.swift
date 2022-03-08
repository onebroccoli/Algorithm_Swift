//
//  Q658. Find K Closest Elements.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/3/22.
//
/*
 658. Find K Closest Elements
 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.

 An integer a is closer to x than an integer b if:

 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
  

 Example 1:

 Input: arr = [1,2,3,4,5], k = 4, x = 3
 Output: [1,2,3,4]
 Example 2:

 Input: arr = [1,2,3,4,5], k = 4, x = -1
 Output: [1,2,3,4]
  

 Constraints:

 1 <= k <= arr.length
 1 <= arr.length <= 104
 arr is sorted in ascending order.
 -104 <= arr[i], x <= 104
 */
import XCTest


private class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var result = [Int]()
        //base case
        if k == 0 {
            return []
        }
        if arr.count == 0 || arr.count == k {
            return arr
        }
        
        //binary search to find the closest element
        var left = 0
        var right = arr.count
        while left < right {
            var mid = left + (right - left) / 2
            if arr[mid] >= x {
                right = mid
            } else {
                left = mid + 1
            }
            
        }
        //initialize sliding window's bounds
        left -= 1
        right = left + 1
        //while the window size is < k
        while right - left < k {
            // Be careful to not go out of bounds
            if left == -1 {
                right += 1
                continue
            }
            // Expand the window towards the side with the closer number
            // Be careful to not go out of bounds with the pointers
            if right == arr.count || abs(arr[left] - target) <= abs(arr[right] - target) {
                left -= 1
            } else {
                right += 1
            }
        }
        //build and return the window
        for i in (left + 1)..<right {
            result.append(arr[i])
        }
        return result
    }
}
class Q658__Find_K_Closest_Elements: XCTestCase {

  

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

  

}
