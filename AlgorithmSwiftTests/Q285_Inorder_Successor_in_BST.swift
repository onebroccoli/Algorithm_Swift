//
//  Q285_Inorder_Successor_in_BST.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/23/22.
//
/*
 285. Inorder Successor in BST
 Given the root of a binary search tree and a node p in it, return the in-order successor of that node in the BST. If the given node has no in-order successor in the tree, return null.

 The successor of a node p is the node with the smallest key greater than p.val.

  

 Example 1:


 Input: root = [2,1,3], p = 1
 Output: 2
 Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.
 Example 2:


 Input: root = [5,3,6,2,4,null,null,1], p = 6
 Output: null
 Explanation: There is no in-order successor of the current node, so the answer is null.
 */
import XCTest
private class Solution {
func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
    var root = root
    var successor: TreeNode? = nil
    while root != nil {
        if p!.val >= root!.val {
            root = root?.right
        } else {
            successor = root
            root = root?.left
        }
    }
    return successor
}
}
class Q285_Inorder_Successor_in_BST: XCTestCase {

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
