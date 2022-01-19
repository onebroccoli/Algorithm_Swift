//
//  Q112_Path_Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 12/3/21.
//
/*
 112. Path Sum
 Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

 A leaf is a node with no children.

  

 Example 1:


 Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 Output: true
 Explanation: The root-to-leaf path with the target sum is shown.
 Example 2:


 Input: root = [1,2,3], targetSum = 5
 Output: false
 Explanation: There two root-to-leaf paths in the tree:
 (1 --> 2): The sum is 3.
 (1 --> 3): The sum is 4.
 There is no root-to-leaf path with sum = 5.
 Example 3:

 Input: root = [], targetSum = 0
 Output: false
 Explanation: Since the tree is empty, there are no root-to-leaf paths.

 */


import XCTest
private class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        var targetSum = targetSum
        if root == nil {
            return false
        }
        targetSum -= root!.val
        if root!.left == nil && root!.right == nil {
            return targetSum == 0
        }
        
        return hasPathSum(root!.left, targetSum) || hasPathSum(root!.right, targetSum)
    }
    
    
    
}
class Q112_Path_Sum: XCTestCase {

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
