//
//  Q1382. Balance a Binary Search Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/1/22.
//
/*
 1382. Balance a Binary Search Tree
 Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

 A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

  

 Example 1:


 Input: root = [1,null,2,null,3,null,4,null,null]
 Output: [2,1,3,null,null,null,4]
 Explanation: This is not the only correct answer, [3,1,4,null,2] is also correct.
 Example 2:


 Input: root = [2,1,3]
 Output: [2,1,3]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 1 <= Node.val <= 105
 */
import XCTest
/*
 //dfs
private class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
            var inOrderArr = [Int]()
            getSortedNodesArray(root, &inOrderArr)
            return getBalancedBinarySearchTree(inOrderArr)
        }
        
        func getBalancedBinarySearchTree(_ rootsArr: [Int]) -> TreeNode? {
            guard !rootsArr.isEmpty else {
                return nil
            }
            let mid = rootsArr.count/2
            let root = TreeNode(rootsArr[mid])
            root.left = getBalancedBinarySearchTree(Array(rootsArr[0 ..< mid]))
            if (mid + 1) <= (rootsArr.count - 1) {
            root.right = getBalancedBinarySearchTree(Array(rootsArr[mid + 1 ..< rootsArr.count]))
            } else {
                root.right = nil
            }
            return root
        }
        
        func getSortedNodesArray(_ root: TreeNode?, _ arr: inout [Int]) {
            guard let inRoot = root else {
                return
            }
            getSortedNodesArray(inRoot.left, &arr)
            arr.append(inRoot.val)
            getSortedNodesArray(inRoot.right, &arr)
        }
}
 */

// binary search
private class Solution {
    
func balanceBST(_ root: TreeNode?) -> TreeNode? {
    var array = [Int]()
    inOrder(root, array: &array)
    return buildBST(array, 0, array.count - 1)
}

//inorder traversal tree to get sorted array
private func inOrder(_ node: TreeNode?, array: inout [Int]) {
    guard let node = node else {return}
    inOrder(node.left, array: &array)
    array.append(node.val)
    inOrder(node.right, array: &array)
}

//turn sorted array into a balanced tree
private func buildBST(_ array: [Int], _ start: Int, _ end: Int) -> TreeNode? {
    if start > end {
        return nil
    }
    let mid = start + (end - start) / 2
    let node = TreeNode(array[mid])
    node.left = buildBST(array, start, mid - 1)
    node.right = buildBST(array, mid + 1, end)
    return node
}
        /*
        round1: start 0, end 3
          mid = 1
        node = treenode(2)
         node(2).left =
        */
        
//        if start - end == 0 {
//            return nil
//        }
//        let midIndex = start + (end - start) / 2
//        let node = TreeNode(array[midIndex])
//        if midIndex > 0 {
//            node.left = treeFromArray(array, start: start, end: midIndex)
//        }
//        if midIndex + 1 < array.count {
//            node.right = treeFromArray(array, start: midIndex + 1, end: end)
//        }
//        return node
    }
    
    /*
     test:
     1
      \2
       \3
        \4
     
     result:
     2
     /\
     1 3
     first convert to 1 2 3 4
     treeFromArray([1,2,3,4], 0, 3)
     mid = 1
     node = TreeNode(2)
     //node(2)
     node(2).left = treeFromArray([1,2,3,4], 0, 1) = node(1)
        //
        mid = 0
        node = treenode(1)
        node(1).right = treeFromArray([1,2,3,4], 1, 1)
         //return nil
        return node(1)
     
     mid(1) + 1< count(4)
     node(2).right = treeFromArray([1,2,3,4], 2, 3) //3
        //
        mid = 2 + (3-2)/2 = 2
        node = treenode(3)
        node(3).left = treeFromArray([1,2,3,4], 2, 2)
            // 2-2 == 0
            return nil
        node(3).right = treeFromArray([1,2,3,4], 3, 3)
            //3 -3 = 0
            return nil
        return node(3)
     
            
        
     */
    

//class Q1382__Balance_a_Binary_Search_Tree: XCTestCase {
//
//
//    func testExample() throws {
//    }
//
//}
