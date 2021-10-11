//
//  Q378_Kth_Smallest_Element_in_a_Sorted_Matrix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/14/21.
//
/*
 Given an n x n matrix where each of the rows and columns are sorted in ascending order, return the kth smallest element in the matrix.

 Note that it is the kth smallest element in the sorted order, not the kth distinct element.

  

 Example 1:

 Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 Output: 13
 Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
 Example 2:

 Input: matrix = [[-5]], k = 1
 Output: -5
  

 Constraints:

 n == matrix.length
 n == matrix[i].length
 1 <= n <= 300
 -109 <= matrix[i][j] <= 109
 All the rows and columns of matrix are guaranteed to be sorted in non-decreasing order.
 1 <= k <= n2
 */

import XCTest

private class Solution{
//    //MINHEAP
//
//    func parent(_ i:Int) -> Int{
//        return Int(floor(Double((i-1))/2));
//    }
//
//    func left(_ i:Int) -> Int {
//        return 2*i+1
//    }
//
//    func right(_ i:Int) -> Int {
//        return 2*i+2
//    }
//
//    //What is siftUp and siftDown
////https://www.raywenderlich.com/586-swift-algorithm-club-heap-and-priority-queue-data-structure
//    func siftUp(_ minheap: inout Array<Int>, _ i:Int) {
//        if(i==0) { return} //base case we are at root
//       let parent = self.parent(i)
//        if(minheap[i] < minheap[parent]){
//            minheap.swapAt(i,parent)
//            siftUp(&minheap, parent)
//        }
//
//    }
//
//    func siftDown(_ minheap: inout Array<Int>, _ i:Int) {
//       let left = self.left(i)
//       let right = self.right(i)
//
//        if(i>minheap.count-1 || left > minheap.count-1 || right > minheap.count-1){
//            return
//        }
//
//        var candidate = i;
//        if(minheap[candidate] > minheap[left]){
//            candidate = left
//        }
//        if(minheap[candidate] > minheap[right]) {
//            candidate = right
//        }
//
//        //we swapped parent with a child, so keep checking if we need to continue sifting down
//        if(i == candidate){
//            return //no swap needed
//        }
//
//        minheap.swapAt(i,candidate)
//        siftDown(&minheap,candidate)
//    }
//
//    func insert(_ minheap: inout Array<Int>, _ value:Int) {
//        minheap.append(value)
//        siftUp(&minheap, minheap.count-1)
//    }
//
//    func remove(_ minheap: inout Array<Int>) {
//        if(minheap.count == 0) {return}
//        minheap.swapAt(0,minheap.count-1)
//        minheap.remove(at:minheap.count-1)
//        siftDown(&minheap,0)
//    }
    
//    //BFS
//    func kthSmallest2(_ matrix: [[Int]], _ k: Int) -> Int {
//        var rows = matrix.count
//        var columns = matrix[0].count
//        //Best First Search, need a minheap on the value of each cells
//        var minheap : Array<Int> = Array<Int>()
//        //all the generated cells will be marked true
//            //to avoid being generated more than once
//
//        var visited = Array2D<Bool>(columns: columns, rows: rows)
//        insert(&minheap,matrix[0][0])
//        visited[0][0] = true
//        //iterate k-1 rounds, and Best First Search the smallest k-1 cells
//        for i in 0..<k - 1 {
//            var cur = remove(&minheap)
//
//            //the neighbor cell will be inserted back to the minheap only if
//                  //1. it is not out of boundary
//                  //2. it has not been generated before
//                  //because for each cell it could be generated twice
//
//            if ()
//        }
//
//    }
    
    
func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int{
    var matrix = matrix
    var left:Int = matrix[0][0]
    var right:Int = matrix.last!.last!
    
    while (left < right){
        let mid:Int = left + (right - left) / 2
        let cnt:Int = search_less_equal(&matrix, mid)
        if cnt < k {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}
    

    
func search_less_equal(_ matrix: inout [[Int]], _ mid: Int) -> Int{
    let n:Int = matrix.count
    var row:Int = n - 1
    var col:Int = 0
    var count:Int = 0
    while (row >= 0 && col < n){
        print("i: \(row) , j: \(col) , n: \(n)")
        if matrix[row][col] <= mid{
            print("maxtrix[i][j]: \(matrix[row][col]) , target: \(mid)")
            count += row + 1
            print("res: \(count)")
            col += 1
        } else {
            row -= 1
        }
    }
    return count
}
    
    
    
    
    func search_less_equal2(_ matrix: inout [[Int]], _ mid: Int, _ smallLargePair: [Int]) -> Int{
        var count  = 0
        var n = matrix.count, row = n - 1, col = 0
        whlie (row >= 0 && col < n) {
            if (matrix{row}[col] > mid) {
                // as matrix[row][col] is bigger than the mid, let's keep track of the
                        // smallest number greater than the mid
                smallLargePair[1] =
            }
        }
    }
}


class Q378_Kth_Smallest_Element_in_a_Sorted_Matrix: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        var matrix = [[1,5,9],[10,11,13],[12,13,15]]
        var k = 8
        let res = s.kthSmallest(matrix, k)
        print(res)
    }


}
