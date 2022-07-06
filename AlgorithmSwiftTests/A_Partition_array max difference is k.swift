//
//  A_Partition_array max difference is k.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/5/22.
//
/*
 Amazon warehouse has a group of n items of various weights lined up in a row. A segment of contiguously placed items can be shipped ogether if only if the difference betweeen the weihts of the heaviest and lightest item differs by at most k to avoid load imbalance.

 Given the weights of the n items and an integer k, fine the number of segments of items that can be shipped together.

 Note: A segment (l,r) is a subarray starting at index l and ending at index r where l less than equal(<=) r.


 Example

 k=3

 weights = [1, 3, 6]

 weight difference between max and min for each (l,r) index pair are:

 (0,0) -> max(weights[0]) - min(weights[0]) = max(1)-min(1) = 1-1 =0

 (0,1) - > max(weights[0],weights[1]) - min(weights[0],weights[1])= max(1,3)-min(1,3)=3-1=2

 (0,2) - > max(weights[0],weights[1],weights[2]) - min(weights[0],weights[1],weights[2])= max(1,3,6)-min(1,3,6)=6-1=5

 (1,1) -> max(weights[1]) - min(weights[1]) = max(3)-min(3) = 3-3 =0

 (1,2) -> max(weights[1],weights[2]) - min(weights[1],weights[2]) = max(3,6)-min(3,6) = 6-3 =3

 (2,2) -> max(weights[2])-min(weights[2]) = max(6)-min(6) = 6-6 =0

 as only 5 out 6 pair, is less than equal equal to k (3) , so the number of segments that can shipped together is 5.

 Constraints

 1<=k, weights[i] <=10^9

 1 <= n <=3*10^5
 */
import XCTest
private class Solution {
    func partitionArray(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        for i in 0..<nums.count {
            for j in i..<nums.count {
                var maxVal = max(nums[i], nums[j])
                var minVal = min(nums[i], nums[j])
                if abs(maxVal - minVal) <= k {
                    count += 1
                }
            }
        }
        return count
    }
 
//    func partitionArray2(_ nums: [Int], _ k: Int) -> Int {
//        var count = 0
//        var left = 0
//        var right = nums.count
//        while left <= nums.count && right >= 0 {
//            var mid = left + (right - left) / 2
//            if abs(nums[mid] - nums[left]) > k {
//                right = mid - 1
//            } else {
//                count += (mid + 1) * (mid + 1 - 1) + (mid + 1)
//                left = mid + 1
//            }
//        }
    }
    

    
class A_Partition_array_max_difference_is_k: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        let a = [1,3,6]
        let result = s.partitionArray(a, 3)
        print ("result is ==== : ", result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
