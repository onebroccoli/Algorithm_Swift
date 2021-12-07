//
//  Q236_Lowest_Common_Ancestor_of_a_Binary_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/4/21.
//
/*
 236. Lowest Common Ancestor of a Binary Tree
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
  
 Example 1:

 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.

 Example 2:

 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.

 Example 3:
 Input: root = [1,2], p = 1, q = 2
 Output: 1

 */
import XCTest
private class Solution {
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {return nil}
    //if root is one or two, we can ignore the later recursion
    if root.val == p?.val || root.val == q?.val {
        return root
    }
    
    var l:TreeNode? = lowestCommonAncestor(root.left, p, q)
    var r: TreeNode? = lowestCommonAncestor(root.right, p, q)
    
    if l != nil && r != nil {
        return root
    }
    return l != nil ? l : r
}
}
class Q236_Lowest_Common_Ancestor_of_a_Binary_Tree: XCTestCase {

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
