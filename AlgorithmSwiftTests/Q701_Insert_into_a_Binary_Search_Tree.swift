//
//  Q701_Insert_into_a_Binary_Search_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/13/21.
//
/*
 You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
 Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
  
 Example 1:

 Input: root = [4,2,7,1,3], val = 5
 Output: [4,2,7,1,3,5]
 Explanation: Another accepted tree is:


 Example 2:
 Input: root = [40,20,60,10,30,50,70], val = 25
 Output: [40,20,60,10,30,50,70,null,null,25]

 Example 3:
 Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
 Output: [4,2,7,1,3,5]

  
 Constraints:
 The number of nodes in the tree will be in the range [0, 104].
 -108 <= Node.val <= 108
 All the values Node.val are unique.
 -108 <= val <= 108
 It's guaranteed that val does not exist in the original BST.

 */
import XCTest
private class Solution {
    func insertIntoBSTRecursion(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {return TreeNode(val)}
        if root.val < val {
            root.right = insertIntoBSTRecursion(root.right, val)
        }
        if root.val > val {
            root.left = insertIntoBSTRecursion(root.left, val)
        }
        return root;
    }
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {return TreeNode(val)}

        var cur : TreeNode? = root //optional
        while cur != nil && cur?.val != val {
            guard let c = cur else {break}
            if c.val < val {
                if c.right == nil {
                    c.right = TreeNode(val)
                }
                cur = c.right
            } else {
                if c.left == nil {
                    c.left = TreeNode(val)
                }
                cur = c.left
            }
        }
        return root

    }
    
    
    
    
}
class Q701_Insert_into_a_Binary_Search_Tree: XCTestCase {

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
