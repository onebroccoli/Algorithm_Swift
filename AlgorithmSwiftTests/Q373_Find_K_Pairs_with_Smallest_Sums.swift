//
//  Q373_Find_K_Pairs_with_Smallest_Sums.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/21/21.
//
/*
 You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k.

 Define a pair (u, v) which consists of one element from the first array and one element from the second array.

 Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.

  

 Example 1:

 Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 Output: [[1,2],[1,4],[1,6]]
 Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
 Example 2:

 Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
 Output: [[1,1],[1,1]]
 Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]
 Example 3:

 Input: nums1 = [1,2], nums2 = [3], k = 3
 Output: [[1,3],[2,3]]
 Explanation: All possible pairs are returned from the sequence: [1,3],[2,3]

 */
import XCTest

private class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        let n1 = nums1.count
        let n2 = nums2.count
        guard n1 > 0 && n2 > 0  else {
            return res
        }
        
        var heap = Heap<Node>(type: .min)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n2), count: n1)
        print("visited")
        print(visited)
        heap.add(Node(nums1[0] + nums2[0], [nums1[0], nums2[0]], 0, 0))
        visited[0][0] = true
        var count = k
        
        while count > 0 && heap.count > 0 {
            var curr = heap.remove()!
            print("curr======", curr)
            res.append(curr.arr)
            count -= 1
            if curr.x + 1 < n1 && !visited[curr.x + 1][curr.y] {
                let i = nums1[curr.x + 1]
                print("curr.x + 1= ",curr.x + 1)
                let j = nums2[curr.y]
                print("curr.y = ",curr.y)
                heap.add(Node(i + j, [i, j], curr.x+1, curr.y))
                visited[curr.x + 1][curr.y] = true
                print("VISITED i+1:")
                print(visited)
            }
            if curr.y + 1 < n2 && !visited[curr.x][curr.y + 1] {
                let i = nums1[curr.x]
                print("curr.i = ",curr.x)

                let j = nums2[curr.y + 1]
                print("curr.y + 1 = ",curr.y + 1)

                heap.add(Node(i + j, [i, j], curr.x, curr.y + 1))
                visited[curr.x][curr.y + 1] = true
                print("VISITED j+1:")
                print(visited)
            }
            
        }
        return res
    }
    
}

struct Node: Comparable{
    var value : Int
    var x:Int
    var y:Int
    var arr : [Int]
    init(_ n: Int, _ array:[Int],_ x:Int,_ y:Int){
        value = n
        arr = array
        self.x = x
        self.y = y
    }
    
    static func < (ls: Node, rs: Node) -> Bool {
        return ls.value < rs.value
    }
    static func == (ls: Node, rs: Node) -> Bool {
        return ls.value == rs.value
    }
}


struct Heap<E: Comparable> {
    enum HeapType { case max, min}
    // an array representng the binary tree
    var tree = [E]()
    
    //indicating i this heap is a max heap or min heap
    let type: HeapType
    var count: Int {
        return tree.count
        
    }
    init(type: HeapType) {
        self.type = type
    }
    
    mutating func add(_ element: E) {
        tree.append(element)
        var child = tree.count - 1
        var parent = (child - 1) / 2
        while child > 0 && !satify(tree[parent], tree[child]) {
            tree.swapAt(parent, child)
            child = parent
            parent = (child - 1) / 2
        }
        
    }
    
    mutating func remove() -> E? {
        let rev = tree.first
        if tree.count > 0 {
            tree.swapAt(0, tree.count - 1)
            tree.removeLast()
            heapify(0)
        }
        return rev
    }
    
    func peek() -> E? {
        return tree.first
    }
    
    mutating private func heapify(_ rootIndex: Int) {
        let count = tree.count
        let leftChild = 2 * rootIndex + 1
        let rightChild = 2 * rootIndex + 2
        
        //no children
        if leftChild >= count {return}
        let targetChild = (rightChild >= count || satify(tree[leftChild], tree[rightChild])) ? leftChild : rightChild
        if (!satify(tree[rootIndex], tree[targetChild])) {
            tree.swapAt(rootIndex, targetChild)
            heapify(targetChild)
        }
    }
    
    private func satify(_ lhs: E, _ rhs: E) -> Bool {
        return self.type == .min ? (lhs <= rhs) : (lhs >= rhs)
    }
}

class Q373_Find_K_Pairs_with_Smallest_Sums: XCTestCase {
    
    
    func testExample() throws {
        let n1 = [1,2,3]
        let n2 = [6,7,8]
        let k = 3
        let s = Solution()
        let result = s.kSmallestPairs(n1, n2, k)
        print("RESULT:=======", result)
    }
    
}
