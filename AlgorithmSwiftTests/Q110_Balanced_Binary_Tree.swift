//
//  Q110_Balanced_Binary_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/12/21.
//
/*
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:

 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: true
 Example 2:


 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 Example 3:

 Input: root = []
 Output: true
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104

 */
import XCTest
private class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {return true}
        return height(root) != -1
    }
    
    func height(_ root: TreeNode?) -> Int {
        var leftHeight: Int
        var rightHeight: Int
        guard let root = root else {return 0}
        leftHeight = height(root.left)
        if leftHeight == -1 {
            return -1
        }
        rightHeight = height(root.right)
        if rightHeight == -1 {
            return -1
        }
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight, rightHeight) + 1
    }
    
}
class Q110_Balanced_Binary_Tree: XCTestCase {



    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
