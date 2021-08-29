//
//  Q349_Intersection_of_Two_Arrays.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/11/21.
//
/*
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.

  

 Example 1:

 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 Example 2:

 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Explanation: [4,9] is also accepted.
  

 Constraints:

 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000
 */
import XCTest
private class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1Sorted = nums1.sorted()
        let nums2Sorted = nums2.sorted()
        var n1 = 0
        var n2 = 0
        var result = [Int]()
        while n1 < nums1.count && n2 < nums2.count {
            if nums1Sorted[n1] < nums2Sorted[n2] {
                n1 += 1
            } else if nums1Sorted[n1] > nums2Sorted[n2] {
                n2 += 1
            } else {
                if n1 == 0 || (n1 != 0 && nums1Sorted[n1] != nums1Sorted[n1 - 1]) {
                    result.append(nums1Sorted[n1])
                }
                
                n1 += 1
                n2 += 1
            }
        }
        return result
    }
    
func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let hashTable1 : Set<Int> = Set(nums1)
    let hashTable2 : Set<Int> = Set(nums2)
    var result = [Int]()
    for num in hashTable2 {
        if hashTable1.contains(num) {
            result.append(num)
        }
    }
    return result

}
    
}
class Q349_Intersection_of_Two_Arrays: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let result = s.intersection([4,9,5],[9,4,9,8,4])
        print (result)
    }


}
