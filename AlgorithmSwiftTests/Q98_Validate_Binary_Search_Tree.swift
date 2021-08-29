//
//  Q98_Validate_Binary_Search_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/13/21.
//
/*
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).
 A valid BST is defined as follows:
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  
 Example 1:

 Input: root = [2,1,3]
 Output: true

 Example 2:

 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.

 */
import XCTest
private class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, Int.min, Int.max)
    }
    
    func isValidBST(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let root = root else {return true}
        if root.val <= min || root.val >= max {
            return false
        }
        return isValidBST(root.left, min, root.val) && isValidBST(root.right, root.val, max)
    }
}
class Q98_Validate_Binary_Search_Tree: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
