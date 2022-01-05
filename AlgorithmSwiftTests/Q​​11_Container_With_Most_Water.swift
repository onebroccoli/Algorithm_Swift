//
//  Q​​11_Container_With_Most_Water.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/4/22.
//
/*
 ​​11. Container With Most Water

 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
 Find two lines that together with the x-axis form a container, such that the container contains the most water.
 Return the maximum amount of water a container can store.
 Notice that you may not slant the container.
  
 Example 1:

 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

 Example 2:
 Input: height = [1,1]
 Output: 1

  
 Constraints:
 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104

 */
import XCTest

private class Solution {
    
    
func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var l = 0
    var r = height.count - 1
    while l < r {
        maxArea = max(maxArea, min(height[l], height[r]) * (r - l))
        if height[l] < height[r] {
        l += 1
    } else {
        r -= 1
    }
    
    }
    
    return maxArea
}
//func maxArea(_ height: [Int]) -> Int {
//    var maxContainer = 0
//    for i in 0..<height.count {
//        for j in 1..<height.count {
//            maxContainer = max(maxContainer,min(height[i],height[j])*(j - i))
//        }
//    }
//    return maxContainer
//}
}

class Q__11_Container_With_Most_Water: XCTestCase {

   

    func testExample() throws {
        let s = Solution()
        let a = [1,8,6,2,5,4,8,3,7]
        var result = s.maxArea(a)
        print("RESULT =====: ", result)
    }

    

}
