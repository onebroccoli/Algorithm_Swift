//
//  Q298_Binary_Tree_Longest_Consecutive_Sequence.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/23/22.
//
/*
 298. Binary Tree Longest Consecutive Sequence
 Given the root of a binary tree, return the length of the longest consecutive sequence path.

 The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path needs to be from parent to child (cannot be the reverse).

  

 Example 1:


 Input: root = [1,null,3,2,4,null,null,null,5]
 Output: 3
 Explanation: Longest consecutive sequence path is 3-4-5, so return 3.
 Example 2:


 Input: root = [2,null,3,2,null,1]
 Output: 2
 Explanation: Longest consecutive sequence path is 2-3, not 3-2-1, so return 2.
  
 */
import XCTest
private class Solution {
func longestConsecutive(_ root: TreeNode?) -> Int {
    var maxLength: Int = 0
    var parent: TreeNode? = nil
    dfs(root, parent, 0, &maxLength)
    return maxLength
}

func dfs(_ node: TreeNode?, _ parent: TreeNode?, _ length: Int, _ maxLength: inout Int) {
    var length = length
    if node == nil {
        return
    }
    length = (parent != nil && node!.val == parent!.val + 1) ? length + 1 : 1
    maxLength = max(maxLength, length)
    dfs(node!.left, node, length, &maxLength)
    dfs(node!.right, node, length, &maxLength)
}
}
class Q298_Binary_Tree_Longest_Consecutive_Sequence: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
