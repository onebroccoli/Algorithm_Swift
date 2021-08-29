//
//  Q94_Binary_Tree_Inorder_Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/12/21.
//
/*
 Given the root of a binary tree, return the inorder traversal of its nodes' values.

  

 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,3,2]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]
 Example 4:


 Input: root = [1,2]
 Output: [2,1]
 Example 5:


 Input: root = [1,null,2]
 Output: [1,2]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  

 Follow up: Recursive solution is trivial, could you do it iteratively?
 */

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


import XCTest
private class Solution {
    func inorderTraversalRecursive(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        helper(root, &result)
        return result
    }
    func helper(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root = root else {return}
        helper(root.left, &result)
        result.append(root.val)
        helper(root.right, &result)
    }
    
func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack: [TreeNode] = []
    var node = root
    while node != nil || !stack.isEmpty {
        //always try go to the left side to see if there is any node should be traversed before the cur node, cur node is stored on stack since it has not been traversed yet.
        while node != nil {
            stack.append(node!)
            node = node?.left
        }
        //if can not go left, meaning all the nodes on the left side of the top node on stack have been traversed, the next traversing node should be the top node on stack.
        node = stack.removeLast()
        res.append(node!.val)
        //the next subtree we need to traverse is right subtree
        node = node?.right
    }
    return res
}
}


class Q94_Binary_Tree_Inorder_Traversal: XCTestCase {

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
