//
//  Q543. Diameter of Binary Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/17/22.
//
/*
 543. Diameter of Binary Tree

 Given the root of a binary tree, return the length of the diameter of the tree.

 The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 The length of a path between two nodes is represented by the number of edges between them.

  

 Example 1:


 Input: root = [1,2,3,4,5]
 Output: 3
 Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
 Example 2:

 Input: root = [1,2]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -100 <= Node.val <= 100
 */
import XCTest
private class Solution {
    var diameter = 0
    
    func diameterOfBinaryTree(_ root: TreeNode? ) -> Int {
        dfs(root)
        return diameter
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        //recursively find the longest path in both left and right child
        var leftPath = dfs(root!.left)
        var rightPath = dfs(root!.right)
        //update diameter if left path and right path is larger
        diameter = max(diameter, leftPath + rightPath)
        //return longest one between left path and right path
        //remember to add 1 for the path connecting the node and its parent
        return max(leftPath, rightPath) + 1
    }
}
class Q543__Diameter_of_Binary_Tree: XCTestCase {

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
