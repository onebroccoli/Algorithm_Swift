//
//  100.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/13/21.
//

/*
 100. Same Tree
 Given the roots of two binary trees p and q, write a function to
 check if they are the same or not.

 Two binary trees are considered the same if they are structurally
 identical, and the nodes have the same value.

  

 Example 1:


 Input: p = [1,2,3], q = [1,2,3]
 Output: true
 Example 2:


 Input: p = [1,2], q = [1,null,2]
 Output: false
 Example 3:


 Input: p = [1,2,1], q = [1,1,2]
 Output: false
  

 Constraints:

 The number of nodes in both trees is in the range [0, 100].
 -104 <= Node.val <= 104
 */
import XCTest
@testable import AlgorithmSwift

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
private class Solution {
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true;
    }
    guard let tree1 = p, let tree2 = q, tree1.val == tree2.val else {return false}
    return isSameTree(tree1.left, tree2.left) && isSameTree(tree1.right, tree2.right)
}
}



class Q100_Same_Tree: XCTestCase {

    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

   

}
