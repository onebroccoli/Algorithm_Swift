//
//  Q1650. Lowest Common Ancestor of a Binary Tree III.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/18/22.
//
/*
 1650. Lowest Common Ancestor of a Binary Tree III
 Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).

 Each node will have a reference to its parent node. The definition for Node is below:

 class Node {
     public int val;
     public Node left;
     public Node right;
     public Node parent;
 }
 According to the definition of LCA on Wikipedia: "The lowest common ancestor of two nodes p and q in a tree T is the lowest node that has both p and q as descendants (where we allow a node to be a descendant of itself)."

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 Example 2:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5 since a node can be a descendant of itself according to the LCA definition.
 Example 3:

 Input: root = [1,2], p = 1, q = 2
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [2, 105].
 -109 <= Node.val <= 109
 All Node.val are unique.
 p != q
 p and q exist in the tree.
 */
import XCTest

private class aNode {
    var val: Int
    var left: aNode?
    var right: aNode?
    var parent: aNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

private class Solution {
    func lowestCommonAncestor(_ p: aNode?,_ q: aNode?) -> aNode? {
        guard var root = p else {
            return nil
        }
        while root.parent != nil {
            root = root.parent!
        }
        
        return lca(root, p, q)
    }
    
    func lca(_ root: aNode?, _ p: aNode?, _ q: aNode?) -> aNode? {
        if root?.val == p?.val || root?.val == q?.val || root == nil {
            return root
        }
        
        let left = lca(root?.left, p, q)
        let right = lca(root?.right, p, q)
        if left == nil {
            return right
        }
        
        if right == nil {
            return right
        }
        
        return root
    }
}
class Q1650__Lowest_Common_Ancestor_of_a_Binary_Tree_III: XCTestCase {

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
