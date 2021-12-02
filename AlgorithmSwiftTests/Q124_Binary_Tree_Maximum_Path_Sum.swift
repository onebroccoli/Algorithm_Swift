//
//  Q124_Binary_Tree_Maximum_Path_Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/2/21.
//
/*
 Q124_Binary_Tree_Maximum_Path_Sum.swift
 L 138. Maximum Path Sum Binary Tree I
 A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

 The path sum of a path is the sum of the node's values in the path.

 Given the root of a binary tree, return the maximum path sum of any non-empty path.

  

 Example 1:


 Input: root = [1,2,3]
 Output: 6
 Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
 Example 2:


 Input: root = [-10,9,20,null,null,15,7]
 Output: 42
 Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
  
 */
import XCTest

private class Solution {
func maxPathSum(_ root: TreeNode?) -> Int {
    var maxSum = Int.min
    helper(root, &maxSum)
    return maxSum
}

func helper(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
    guard let root = root else {return 0}

    let left = max(0,  helper(root.left, &maxSum))
    let right = max(0, helper(root.right, &maxSum))
    maxSum = max(maxSum, left + root.val + right)
    return max(left, right) + root.val
}
    
}

  


class Q124_Binary_Tree_Maximum_Path_Sum: XCTestCase {

   

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    

}
