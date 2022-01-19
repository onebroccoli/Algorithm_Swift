//
//  Q99_Recover_Binary_Search_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 99. Recover Binary Search Tree
 You are given the root of a binary search tree (BST), where the values of exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.

  

 Example 1:


 Input: root = [1,3,null,null,2]
 Output: [3,1,null,null,2]
 Explanation: 3 cannot be a left child of 1 because 3 > 1. Swapping 1 and 3 makes the BST valid.
 Example 2:


 Input: root = [3,1,4,null,null,2]
 Output: [2,1,4,null,null,3]
 Explanation: 2 cannot be in the right subtree of 3 because 2 < 3. Swapping 2 and 3 makes the BST valid.
  
 */
import XCTest
private class Solution {
    var x : TreeNode? = nil
    var y: TreeNode? = nil
    var pred: TreeNode? = nil
    
    
    func recoverTree(_ root: TreeNode?) {
        //1. use dfs recursively find the two nodes that need to be swapped
        findTwoSwapped(root)
        //2. swap
        swap(x,y)
    }
    
    //1. use dfs recursively find the two nodes that need to be swapped
    
    func findTwoSwapped(_ root: TreeNode?) {
        if root == nil {
            return
        }
        findTwoSwapped(root!.left)
        if pred != nil && root!.val < pred!.val {
            y = root
            if x == nil {
                x = pred
            } else {
                return
            }
        }
        pred = root //make pred to be the current root, since root value is largest on the left side.
        findTwoSwapped(root!.right)
    }
    
    //2. swap the two treenodes
    func swap(_ a: TreeNode?, _ b: TreeNode?) {
        var tmp: Int = a!.val
        a!.val = b!.val
        b!.val = tmp
    }
    
    
}
class Q99_Recover_Binary_Search_Tree: XCTestCase {

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
