//
//  Q156_Binary_Tree_Upside_Down.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 156. Binary Tree Upside Down
 Given the root of a binary tree, turn the tree upside down and return the new root.

 You can turn a binary tree upside down with the following steps:

 The original left child becomes the new root.
 The original root becomes the new right child.
 The original right child becomes the new left child.

 The mentioned steps are done level by level. It is guaranteed that every right node has a sibling (a left node with the same parent) and has no children.

  

 Example 1:


 Input: root = [1,2,3,4,5]
 Output: [4,5,2,null,null,3,1]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]
  
 */
import XCTest
private class Solution {
func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil || root!.left == nil {
        return root
    }
    
    var newRoot = upsideDownBinaryTree(root!.left)
    root!.left!.left = root!.right
    root!.left!.right = root
    root!.left = nil
    root!.right = nil
    return newRoot
}
}
class Q156_Binary_Tree_Upside_Down: XCTestCase {

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
