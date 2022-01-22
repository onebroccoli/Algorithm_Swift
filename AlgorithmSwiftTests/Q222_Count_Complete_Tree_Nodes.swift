//
//  Q222_Count_Complete_Tree_Nodes.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/21/22.
//
/*
 222. Count Complete Tree Nodes
 Given the root of a complete binary tree, return the number of the nodes in the tree.

 According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Design an algorithm that runs in less than O(n) time complexity.

  

 Example 1:


 Input: root = [1,2,3,4,5,6]
 Output: 6
 Example 2:

 Input: root = []
 Output: 0
 Example 3:

 Input: root = [1]
 Output: 1
  
 */
import XCTest
private class Solution {
    
    func computeDepth(_ node: TreeNode?) -> Int {
        var depth: Int = 0
        var node = node
        while node!.left != nil {
            node = node!.left
            depth += 1
        }
        return depth
    }
    
    //last level nodes are enumerated from 1 to 2^d -1 (left -> right)
    //return true if last level node index exists
    //binary search with O(d) complexity
    
    func exists(_ idx: Int, _ depth: Int, _ node: TreeNode?) -> Bool {
        var node = node
        var left = 0
        var right = Int(pow(Double(2), Double(depth)) - 1.0)
        var mid: Int = 0
        for i in 0..<depth {
            mid = left + (right - left)/2
            if idx <= mid {
                node = node!.left
                right = mid
            } else {
                node = node!.right
                left = mid + 1
            }
        }
        return node != nil
    }
    
    func countNodes(_ root: TreeNode?) -> Int {
        //if tree is empty
        if root == nil {
            return 0
        }
        var depth = computeDepth(root)
        //if the trees contains 1 node
        if depth == 0 {
            return 1
        }
        
        //last level nodes are enumerated from 0 to 2^d -1
        //perform binary search to check how many nodes exist
        var left = 1
        var right = Int(pow(Double(2), Double(depth)) - 1.0)
        while left <= right {
            var mid: Int = left + (right - left) / 2
            if exists(mid, depth, root){
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        //tree contains 2^d - 1 nodes on the first d-1 levels and left nodes on the last level
        return Int(pow(Double(2), Double(depth)) - 1.0) + left
    }
}
class Q222_Count_Complete_Tree_Nodes: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
