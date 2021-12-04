//
//  L_Max_Path_Sum_From_Leaf_To_Root.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/3/21.
//
/*
 L639. Max Path Sum From Leaf To Root
 Given a binary tree in which each node contains an integer number.
 Find the maximum possible path sum from a leaf to root.



 Assumptions

 The root of given binary tree is not null.



 Examples



          10

        /      \

     -2        7

   /     \

 8      -4

 The maximum path sum is 10 + 7 = 17.
 */
import XCTest
private class Solution {
func maxPathSumLeafToRoot(_ root: TreeNode?) -> Int {
    guard let root = root else {return 0}
    if root.left == nil && root.right == nil {
        return root.val
    }
    if root.left == nil {
        return maxPathSumLeafToRoot(root.right) + root.val
    }
    if root.right == nil {
        return maxPathSumLeafToRoot(root.left) + root.val
    }
    return root.val + max(maxPathSumLeafToRoot(root.left), maxPathSumLeafToRoot(root.right))
    
}
}
    
    class L_Max_Path_Sum_From_Leaf_To_Root: XCTestCase {

   
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
