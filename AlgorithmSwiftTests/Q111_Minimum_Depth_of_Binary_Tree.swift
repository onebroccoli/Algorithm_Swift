//
//  Q111_Minimum_Depth_of_Binary_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/10/22.
//
/*
 Given a binary tree, find its minimum depth.
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 Note: A leaf is a node with no children.
  
 Example 1:

 Input: root = [3,9,20,null,null,15,7]
 Output: 2

 Example 2:
 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5

 */
import XCTest
private class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        if root!.left == nil && root!.right == nil {
            return 1
        }
        if root!.left == nil {
            return minDepth(root!.right) + 1
        } else if root!.right == nil {
            return minDepth(root!.left) + 1
        } else {
            let minLeft = minDepth(root!.left)
            let minRight = minDepth(root!.right)
            return (minLeft < minRight ? minLeft : minRight) + 1
        }
        
        
        
    }
}
class Q111_Minimum_Depth_of_Binary_Tree: XCTestCase {

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
