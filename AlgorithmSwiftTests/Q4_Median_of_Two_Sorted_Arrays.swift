//
//  Q4_Median_of_Two_Sorted_Arrays.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/17/21.
//
/*
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

 The overall run time complexity should be O(log (m+n)).

  

 Example 1:

 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 Example 2:

 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 Example 3:

 Input: nums1 = [0,0], nums2 = [0,0]
 Output: 0.00000
 Example 4:

 Input: nums1 = [], nums2 = [1]
 Output: 1.00000
 Example 5:

 Input: nums1 = [2], nums2 = []
 Output: 2.00000
  

 Constraints:

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106
 */
import XCTest
private class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var merged = [Int]()
        let m = nums1.count
        let n = nums2.count
        var index1 = 0
        var index2 = 0
        var count = (m + n) / 2 + 1
        let medianRemainder = (m + n) % 2
        //count rule: odd, take medianInteger, even: medianInteger + 1
//        var count = medianRemainder == 1 ? medianInteger + 1 : medianInteger
        var countSize = count
        while index1 < m && index2 < n {
            if count > 0 {
                if nums1[index1] <= nums2[index2] {
                    merged.append(nums1[index1])
                    count -= 1
                    index1 += 1
                } else if nums1[index1] > nums2[index2]{
                    merged.append(nums2[index2])
                    count -= 1
                    index2 += 1
                }
            } else {
                break
            }
                
        }
        if index1 < m {
            while index1 < m && count > 0 {
                merged.append(nums1[index1])
                index1 += 1
                count -= 1
            }
        }
        if index2 < n {
            while index2 < n && count > 0 {
                merged.append(nums2[index2])
                index2 += 1
                count -= 1
            }
        }
        let output = medianRemainder == 1 ? Double(merged[countSize - 1]) : (Double(merged[countSize - 1]) + Double(merged[countSize - 2])) / 2.0
        return output
    }

}
class Q4_Median_of_Two_Sorted_Arrays: XCTestCase {

    func testExample() throws {
        let s = Solution()
//        let a = [1,2,5]
//        let b = [2,3]
        let a = [1,3]
        let b = [2]
        let result = s.findMedianSortedArrays(a, b)
        let newArray = (a + b).sorted()
        print (newArray)
        print ("result is " ,result)
    }

}

