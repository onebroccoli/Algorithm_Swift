//
//  Q102_Binary_Tree_Level_Order_Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/16/21.
//
/*
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
  
 Example 1:

 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]

 Example 2:
 Input: root = [1]
 Output: [[1]]

 Example 3:
 Input: root = []
 Output: []

  
 Constraints:
 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000

 */
import XCTest

class Q102_Binary_Tree_Level_Order_Traversal: XCTestCase {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        //base case
        guard let root = root else {return [[]]}
        var queue = [TreeNode]()
        var output = [[Int]]()
        queue.append(root)
        
        while !queue.isEmpty {
            //start new level
            var levelCount = queue.count //store how many nodes on the current level
            var levelNodes = [Int]()
            while levelCount > 0 {
                let node = queue.first!
                queue.removeFirst()
                levelCount -= 1
                levelNodes.append(node.val)
                //add left child node
                if let left = node.left {
                    queue.append(left)
                }
                //add right child node
                if let right = node.right {
                    queue.append(right)
                }
            }
            output.append(levelNodes)
        }
        return output
    }
    
    
    
    
    
    
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        //base case
//        guard let root = root else {return []}
//        var queue = [TreeNode]()
//        var output = [[Int]]()
//        queue.append(root)
//
//        while !queue.isEmpty {
//            //start new level
//            //number of elements in the current level
//            var levelCount = queue.count
//            var levelNodes = [Int]()
//            while levelCount > 0 {
//                let node = queue.first!
//                queue.removeFirst()
//                levelCount -= 1
//                levelNodes.append(node.val)
//                //add left child node
//                if let left = node.left {
//                    queue.append(left)
//                }
//                //add right child node
//                if let right = node.right {
//                    queue.append(right)
//                }
//
//            }
//            //add nodes by level
//            output.append(levelNodes)
//        }
//        return output
//    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
