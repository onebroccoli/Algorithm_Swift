//
//  Q104_Maximum_Depth_of_Binary_Tree.swift
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

  

 */
import XCTest

class Q104_Maximum_Depth_of_Binary_Tree: XCTestCase {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        var depth: Int = 0
        var stack: [TreeNode] = [node]
        while !stack.isEmpty {
            var stackSize = stack.count
            while stackSize > 0 {
                let lastNode = stack.popLast()!
                if let left = lastNode.left {
                    stack.insert(left, at: 0)
                }
                if let right = lastNode.right {
                    stack.insert(right, at: 0)
                }
                stackSize -= 1
            }
            depth += 1
        }
        return depth
    }
    
    func maxDepthRecursion(_ root: TreeNode?) -> Int {
        var max: Int = 0
        if root != nil {
            max += 1
            var maxLeft: Int = maxDepthRecursion(root!.left)
            var maxRight: Int = maxDepthRecursion(root!.right)
            max += (maxLeft > maxRight ? maxLeft : maxRight)
        }
        return max
    }
}
