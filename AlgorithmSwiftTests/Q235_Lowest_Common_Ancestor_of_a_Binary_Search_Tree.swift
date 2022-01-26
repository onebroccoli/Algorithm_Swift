//
//  Q235_Lowest_Common_Ancestor_of_a_Binary_Search_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/21/22.
//
/*
 235. Lowest Common Ancestor of a Binary Search Tree
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

  

 Example 1:


 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 Output: 6
 Explanation: The LCA of nodes 2 and 8 is 6.
 Example 2:


 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 Output: 2
 Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
 Example 3:

 Input: root = [2,1], p = 2, q = 1
 Output: 2
  
 */
import XCTest
private class Solution {
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil {
        return root
    }
    //value of current node/parent node
    var parentVal: Int = root!.val
    //value of p
    var pVal = p!.val
    //value of q
    var qVal = q!.val
    
    if pVal > parentVal && qVal > parentVal {
        //if both p q > parent, search right subtree
        return lowestCommonAncestor(root!.right, p, q)
        
    } else if pVal < parentVal && qVal < parentVal {
        return lowestCommonAncestor(root!.left, p, q)
        
    } else { //find the split point, the LCA node
        return root
    }
    
}
}
class Q235_Lowest_Common_Ancestor_of_a_Binary_Search_Tree: XCTestCase {

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
