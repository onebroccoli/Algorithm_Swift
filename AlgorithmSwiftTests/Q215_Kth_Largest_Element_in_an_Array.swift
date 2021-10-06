//
//  Q215_Kth_Largest_Element_in_an_Array.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/5/21.
//

/*
 Given an integer array nums and an integer k, return the kth largest element in the array.
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
  
 Example 1:
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5

 Example 2:
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4

  
 Constraints:
 1 <= k <= nums.length <= 104
 -104 <= nums[i] <= 104


 */
import XCTest

private class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let quickSortResult = quickSort(nums, 0, nums.count - 1)
        let resultNums = quickSortResult.0
        print(resultNums)
        let keyIndex = quickSortResult.1
        
        if keyIndex + 1 == k {
            
        } else if keyIndex + 1 > k {
            return findKthLargest(Array(resultNums[0..<keyIndex]), k)
        } else {
            let index = resultNums.index(after:keyIndex)
            let endIndex = resultNums.endIndex
            return findKthLargest(Array(resultNums[index..<endIndex]), k - keyIndex - 1)
        }
        return resultNums[keyIndex]
        
    }
    
    func quickSort(_ nums: [Int], _ left: Int, _ right: Int) -> ([Int], Int) {
        var numsArray = nums
        var i = left
        var j = right
        let key = numsArray[i]
        while i != j {
            while j > i && numsArray[j] <= key {
                j -= 1
            }
            numsArray.swapAt(i, j)
            while j > i && numsArray[i] >= key {
                i += 1
            }
            numsArray.swapAt(i, j)
        }
        numsArray[i] = key
        return (numsArray, i)
    }
}


class Q215_Kth_Largest_Element_in_an_Array: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let array = [3,2,1,5,6,4]
        let k = 2
        let res = s.findKthLargest(array, k)
        print(res)
    }


}

