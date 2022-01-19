//
//  Q114_Flatten_Binary_Tree_to_Linked_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 114. Flatten Binary Tree to Linked List
 Given the root of a binary tree, flatten the tree into a "linked list":

 The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
 The "linked list" should be in the same order as a pre-order traversal of the binary tree.
  

 Example 1:


 Input: root = [1,2,5,3,4,null,6]
 Output: [1,null,2,null,3,null,4,null,5,null,6]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
  

 Follow up: Can you flatten the tree in-place (with O(1) extra space)?
 */
import XCTest
private class Solution {
func flatten(_ root: TreeNode?) {
    flattenTree(root)
}

func flattenTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    //for a leaf node, return node as is
    if root!.left == nil && root!.right == nil {
        return root
    }
    
    //recursively flatten the left subtree
    var left: TreeNode? = flattenTree(root!.left)
    
    //recursively flatten the right subtree
    var right: TreeNode? = flattenTree(root!.right)
    
    //if has left subtree, shuffle connections so nothing on the left side
    if left != nil {
        left!.right = root!.right
        root!.right = root!.left
        root!.left = nil
    }
    
    
    return right == nil ? left : right
}
}
class Q114_Flatten_Binary_Tree_to_Linked_List: XCTestCase {

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
