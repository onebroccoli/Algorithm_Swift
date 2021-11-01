//
//  L_Tweaked_Identical_Binary_Trees.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/1/21.
//
/*
 Determine whether two given binary trees are identical assuming any number of ‘tweak’s are allowed. A tweak is defined as a swap of the children of one node in the tree.
 Examples
         5
       /    \
     3        8
   /   \
 1      4
 and
         5
       /    \
     8        3
            /   \
           1     4
 the two binary trees are tweaked identical.
 How is the binary tree represented?
 We use the level order traversal sequence with a special symbol "#" denoting the null node.
 For Example:
 The sequence [1, 2, 3, #, #, 4] represents the following binary tree:
     1
   /   \
  2     3
       /
     4

 */
import XCTest

private class Solution {
    //true: both nil
    //false:
    //1) one root is nil
    //2) root.val is not equal
    func isTweakedIdentical(_ one: TreeNode?, _ two: TreeNode?) -> Bool {
        if one == nil && two == nil {
            return true
        } else if one == nil || two == nil {
            return false
        } else if one!.val != two!.val {
            return false
        }
        return isTweakedIdentical(one?.left, two?.right) && isTweakedIdentical(one?.right, two?.left) || isTweakedIdentical(one?.left, two?.left) && isTweakedIdentical(one?.right, two?.right)
        
    }
}

class L_Tweaked_Identical_Binary_Trees: XCTestCase {


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
