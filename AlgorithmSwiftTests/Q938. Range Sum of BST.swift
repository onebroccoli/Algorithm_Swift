//
//  Q938. Range Sum of BST.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 938. Range Sum of BST
 Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].
 
 
 
 Example 1:
 
 
 Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
 Output: 32
 Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
 Example 2:
 
 
 Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
 Output: 23
 Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 2 * 104].
 1 <= Node.val <= 105
 1 <= low <= high <= 105
 All Node.val are unique.
 */
import XCTest
private class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var res: Int = 0
        dfs(root, &res, low, high)
        return res
    }
    
    func dfs(_ root: TreeNode?, _ res: inout Int, _ low: Int, _ high: Int) {
        if root == nil {
            return
        }
        if root != nil {
            if low <= root!.val && root!.val <= high {
                res += root!.val
            }
            if low < root!.val {
                dfs(root!.left, &res, low, high)
            }
            if root!.val < high {
                dfs(root!.right, &res, low, high)
            }
            
        }
    }
    
    func rangeSumBST2(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var res = 0
        var stack: [TreeNode?] = [root]
        while !stack.isEmpty {
            var node = stack.removeLast()
            if node != nil {
                if low <= node!.val && node!.val <= high {
                    res += node!.val
                }
                if low < node!.val {
                    stack.append(node!.left)
                }
                if node!.val < high {
                    stack.append(node!.right)
                }
            }
            
        }
        return res
        
    }
}
class Q938__Range_Sum_of_BST: XCTestCase {
 
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
  
}
