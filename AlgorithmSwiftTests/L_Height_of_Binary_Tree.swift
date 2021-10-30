//
//  L_Height_of_Binary_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/29/21.
//
/*
 Find the height of binary tree.
 Examples:
         5
       /    \
     3        8
   /   \        \
 1      4        11
 The height of above binary tree is 3.
 How is the binary tree represented?
 We use the level order traversal sequence with a special symbol "#" denoting the null node.
 For Example:
 The sequence [1, 2, 3, #, #, 4] represents the following binary tree:
     1
   /   \
  2     3
       /
     4

 */
import XCTest

private class Solution {
func findHeight(_ root: TreeNode?) -> Int {
    guard let root = root else {return 0}
    var heightLeft = findHeight(root.left)
    var heightRight = findHeight(root.right)
    var current = max(heightLeft, heightRight) + 1
    return current
}

}

class L_Height_of_Binary_Tree: XCTestCase {

   

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

 

}
