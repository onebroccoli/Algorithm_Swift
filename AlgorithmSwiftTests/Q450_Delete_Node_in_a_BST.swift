//
//  Q450_Delete_Node_in_a_BST.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/15/21.
//
/*
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.
 Follow up: Can you solve it with time complexity O(height of tree)?

  

 Example 1:


 Input: root = [5,3,6,2,4,null,7], key = 3
 Output: [5,4,6,2,null,null,7]
 Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
 One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
 Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.

 Example 2:

 Input: root = [5,3,6,2,4,null,7], key = 0
 Output: [5,3,6,2,4,null,7]
 Explanation: The tree does not contain a node with value = 0.
 Example 3:

 Input: root = [], key = 0
 Output: []

 */

//solution: https://programmerall.com/article/61711561968/

import XCTest
private class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {return root}
        var temp = root
        //case1:looking for deletion in the left subtree
        if temp!.val > key {
            temp?.left = deleteNode(temp?.left, key)
        //case2: looking for deletion in the right subtree
        } else if temp!.val < key {
            temp?.right = deleteNode(temp?.right, key)
        } else {
        //case3.1: find the node , if te node has a child
            if temp?.left == nil || temp?.right == nil {
                temp = temp?.left == nil ? temp?.right : temp?.left
           //case3.2: find the node, if has both children
            } else {
                var node = temp!.right!
                while node.left != nil {
                    node = node.left!
                }
                temp!.val = node.val
                temp?.right = deleteNode(temp?.right, node.val)
            }
        }
        return temp
    }
}
 
class Q450_Delete_Node_in_a_BST: XCTestCase {


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
