//
//  Q700_Search_in_a_Binary_Search_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/13/21.
//
/*
 You are given the root of a binary search tree (BST) and an integer val.

 Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

  

 Example 1:


 Input: root = [4,2,7,1,3], val = 2
 Output: [2,1,3]
 Example 2:


 Input: root = [4,2,7,1,3], val = 5
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [1, 5000].
 1 <= Node.val <= 107
 root is a binary search tree.
 1 <= val <= 107

 */
import XCTest

private class Solution {
    
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var cur = root
        while cur != nil && cur!.val != val {
            if cur!.val < val {
                cur = cur!.right
            } else if cur!.val >= val {
                cur = cur!.left
            }
        }
        return cur
    }


}




class Q700_Search_in_a_Binary_Search_Tree: XCTestCase {

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
