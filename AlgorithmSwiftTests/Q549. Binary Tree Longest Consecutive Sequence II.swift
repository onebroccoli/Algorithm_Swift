//
//  Q549. Binary Tree Longest Consecutive Sequence II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 549. Binary Tree Longest Consecutive Sequence II
 Given the root of a binary tree, return the length of the longest consecutive path in the tree.

 A consecutive path is a path where the values of the consecutive nodes in the path differ by one. This path can be either increasing or decreasing.

 For example, [1,2,3,4] and [4,3,2,1] are both considered valid, but the path [1,2,4,3] is not valid.
 On the other hand, the path can be in the child-Parent-child order, where not necessarily be parent-child order.

  

 Example 1:


 Input: root = [1,2,3]
 Output: 2
 Explanation: The longest consecutive path is [1, 2] or [2, 1].
 Example 2:


 Input: root = [2,1,3]
 Output: 3
 Explanation: The longest consecutive path is [1, 2, 3] or [3, 2, 1].
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3 * 104].
 -3 * 104 <= Node.val <= 3 * 104
 */
import XCTest
private class Solution {
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var maxVal = 0
        longestPath(root, &maxVal)
        return maxVal
    }
    
    func longestPath(_ root: TreeNode?, _ maxVal: inout Int) -> [Int] {
        if root == nil {
            return [0, 0]
        }
        var increase = 1
        var decrease = 1
        if root?.left != nil {
            var left = longestPath(root!.left, &maxVal)
            if root!.val == root!.left!.val + 1 {
                decrease = left[1] + 1
            } else if root!.val == root!.left!.val - 1 {
                increase = left[0] + 1
            }
        }
        if root!.right != nil {
            var right = longestPath(root!.right, &maxVal)
            if root!.val == root!.right!.val + 1 {
                decrease = max(decrease, right[1] + 1)
            } else if root!.val == root!.right!.val - 1 {
                increase = max(increase, right[0] + 1)
            }
        }
        maxVal = max(maxVal, decrease + increase - 1)
        return [increase, decrease]
        
    }
}
class Q549__Binary_Tree_Longest_Consecutive_Sequence_II: XCTestCase {


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
