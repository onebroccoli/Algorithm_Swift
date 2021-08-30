//
//  Q958_Check_Completeness_of_a_Binary_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/14/21.
//

/*
 Given the root of a binary tree, determine if it is a complete binary tree.

 In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

  

 Example 1:


 Input: root = [1,2,3,4,5,6]
 Output: true
 Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
 Example 2:


 Input: root = [1,2,3,4,5,null,7]
 Output: false
 Explanation: The node with value 7 isn't as far left as possible.
  
 */


import XCTest

private class Solution{
    func isCompleteTree(_ root : TreeNode?) -> Bool{
        guard let node = root else {
            return true
        }
        var queue : [TreeNode] = [node]
        var flag = false
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if  let left = cur.left {
                queue.append(left)
                if flag {
                    return false
                }
            } else {
                    flag = true
                }
            
            if let right = cur.right {
                queue.append(right)
                if flag {
                    return false
                }
            } else {
                flag = true
            }
        }
        return true
    }
}


class Q958_Check_Completeness_of_a_Binary_Tree: XCTestCase {

    
//add test case
    func testExample() throws {
//        let s = Solution()
//        let result = s.isCompleteTree(<#T##root: TreeNode?##TreeNode?#>)
    }

}
