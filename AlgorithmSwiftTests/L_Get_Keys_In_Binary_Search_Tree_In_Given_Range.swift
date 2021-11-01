//
//  L_Get_Keys_In_Binary_Search_Tree_In_Given_Range.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/1/21.
//
/*
 
 (55). Get Keys In Binary Search Tree In Given Range
 Get the list of keys in a given binary search tree in a given range[min, max] in ascending order, both min and max are inclusive.
 Examples
         5
       /    \
     3        8
   /   \        \
  1     4        11
 get the keys in [2, 5] in ascending order, result is  [3, 4, 5]
 Corner Cases
 What if there are no keys in the given range? Return an empty list in this case.
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
func getRange(_ root: TreeNode?, _ min: Int, _ max: Int) -> [Int] {
    var list = [Int]()
    getRange(root, min, max, &list)
    return list
}

func getRange(_ root: TreeNode?, _ min: Int, _ max: Int, _ list: inout [Int]){
    //sanity check
    guard let root = root else {return} //if nil, return empty list
    //1. determine if left subtree should be traversed, only when root.key > min, we should traverse the left subtree
    if root.val > min {
        getRange(root.left, min, max, &list)
    }
    //2. determine if root should be traversed
    if root.val >= min && root.val < max {
        list.append(root.val)
    }
    //3. determine if right subtree should be traversed, only when root.key < max, we should traversed the right subtree;
    if root.val < max {
        getRange(root.right, min, max, &list)
    }
}
}


class L_Get_Keys_In_Binary_Search_Tree_In_Given_Range: XCTestCase {


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
