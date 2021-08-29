//
//  Q658_Find_K_Closest_Elements.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/26/21.
//
/*
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
  
 */
import XCTest

private class Solution{
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int]{
            var result = [Int]()
            //base case
            if (k == 0){
                return [0]
            }
            if arr.count == 0 || arr.count == k {
                return arr
            }

            //binary search to find the closest element
            var left = 0
            var right = arr.count
            var mid = 0
            while (left < right){
                mid = left + (right - left) / 2
                if arr[mid] >= x {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            //initialize our sliding window's bounds
            left -= 1
            right = left + 1
            //while the window size is less than k
            while (right - left - 1 < k){
                //be careful to not go out of bounds
                if left == -1 {
                    right += 1
                    continue
                }
                if (right == arr.count || abs(arr[left] - x) <= abs(arr[right] - x)){
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
    
//    func findClosestElements2(_ arr: [Int], _ k: Int, _ x: Int) -> [Int]{
//            if arr.count == 0 {
//                return arr
//            }
//            if (k == 0){
//                return [0]
//            }
//            //left is the index of the largest smaller or equal element
//            //right = left + 1
//            //these two should be the closest to target
//            var left = largestSmallerEqual(arr, x)
//            var right = left + 1
//            var result = [Int]()
//            for i in 0..<k{
//                if (arr.count <= right) || ((left >= 0) && (x - arr[left] <= arr[right] - x )) {
//                    result.append(arr[left])
//                    left -= 1
//                } else {
//                result.append(arr[right])
//                right += 1
//                }
//            }
//            return result
//            
//        }
//        
//        func largestSmallerEqual(_ arr: [Int], _ target: Int) -> Int{
//            //find the largest smaller or equal element's index in the array
//            var left = 0
//            var right = arr.count - 1
//            while (left < right - 1){
//                let mid = left + (right - left) / 2
//                if (arr[mid] <= target){
//                    left = mid
//                } else {
//                    right = mid
//                }
//            }
//            if arr[right] <= target {
//                return right
//            }
//            if arr[left] <= target{
//                return left
//            }
//            //cannot find
//            return -1
//        }

}




class Q658_Find_K_Closest_Elements: XCTestCase {

    

    func testExample() throws {
        
        let s = Solution()
        let result = s.findClosestElements([1,2,3,4,5], 4, 3)
        let expected = [1, 2, 3, 4]
        XCTAssert(result == expected);
    }


}
