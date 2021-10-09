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
    //pick a pivot (start from the right side)
    var nums = nums
    return quickSelect(&nums, 0, nums.count - 1, k - 1) //k-1 to get k into zero-based index format. kth largest = [k-1] position in the array
    
    
}

func quickSelect(_ nums: inout [Int], _ begin: Int, _ end: Int, _ k: Int) -> Int {
    let pivot = end
    var i = begin
    
    //partition:
    for j in i..<pivot {
        if nums[j] > nums[pivot] {
            nums.swapAt(i, j)
            i += 1
        }
    }
    //put pivot in the correct position
    nums.swapAt(i, pivot)
    
    //base case
    if (i == k) {
        return nums[i]
    }
    
    //recursion
    if (i < k) {
        return quickSelect(&nums, i + 1, end, k) //go right
    }
    return quickSelect(&nums, begin, i - 1, k)
    
}
    
}


private class Solution2 {
    func parent(_ i: Int) -> Int {
        return Int(floor(Double(i - 1)/2))
    }
    
    func left(_ i: Int) -> Int {
        return 2*i + 1
    }
    func right(_ i: Int) -> Int {
        return 2*i + 2
        
    }
    
    func siftUp(_ minheap: inout Array<Int>, _ i:Int) {
        if(i==0) { return} //base case we are at root
        let parent = self.parent(i)
        if(minheap[i] < minheap[parent]){
            minheap.swapAt(i,parent)
            siftUp(&minheap, parent)
        }
        
    }
    
    func siftDown(_ minheap: inout Array<Int>, _ i:Int) {
        let left = self.left(i)
        let right = self.right(i)
        
        if(i>minheap.count-1 || left > minheap.count-1 || right > minheap.count-1){
            return
        }
        
        var candidate = i;
        if(minheap[candidate] > minheap[left]){
            candidate = left
        }
        if(minheap[candidate] > minheap[right]) {
            candidate = right
        }
        
        //we swapped parent with a child, so keep checking if we need to continue sifting down
        if(i == candidate){
            return //no swap needed
        }
        
        minheap.swapAt(i,candidate)
        siftDown(&minheap,candidate)
    }
    
    
    
    func insert(_ minheap: inout Array<Int>, _ value:Int) {
        minheap.append(value)
        siftUp(&minheap, minheap.count-1)
    }
    
    func remove(_ minheap: inout Array<Int>) {
        if(minheap.count == 0) {return}
        minheap.swapAt(0,minheap.count-1)
        minheap.remove(at:minheap.count-1)
        siftDown(&minheap,0)
    }
    
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        var minheap : Array<Int> = Array<Int>()
        
        for n in nums {
            //insert into minheap
                //fix the minheap if minheap.count == k
                //if n < minheap.top
                    //continue; there are already k items larger than n inside the minheap
                //if n >= minheap.top
                    //remove minheap.top and insert n because n is candidate but minheap.top is not anymore
            
            if(minheap.count == k && minheap.count > 0) {
                if(n < minheap[0]) {
                    continue;
                } else {
                    remove(&minheap)
                }
            }
            
            insert(&minheap,n)
            
        }
        return minheap[0]
    }
}


class Q215_Kth_Largest_Element_in_an_Array: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let array = [3,2,1,5,6,4]
        let k = 2
        let res = s.findKthLargest(array, k)
        print("result is: \(res)")
    }


}

