//
//  Q144_Binary_Tree_Preorder_Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/12/21.
//
/*
 144. Binary Tree Preorder Traversal
 Given the root of a binary tree, return the preorder traversal of its nodes' values.

  

 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,2,3]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]
 Example 4:


 Input: root = [1,2]
 Output: [1,2]
 Example 5:


 Input: root = [1,null,2]
 Output: [1,2]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  

 Follow up: Recursive solution is trivial, could you do it iteratively?
 */
import XCTest

private class Solution {
func preorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    helperRecursion(root, &res)
    return res
}

func helperRecursion(_ root: TreeNode?, _ res: inout [Int]) {
    guard let root = root else {return}
    res.append(root.val)
    helperRecursion(root.left, &res)
    helperRecursion(root.right, &res)
}
    
    
func preorderTraversalIter(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack: [TreeNode] = []
    var node = root
    while !stack.isEmpty || node != nil {
        while node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node?.left
        }
        node = stack.removeLast()
        node = node?.right
    }
    return res
    
}
}


class Q144_Binary_Tree_Preorder_Traversal: XCTestCase {

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
