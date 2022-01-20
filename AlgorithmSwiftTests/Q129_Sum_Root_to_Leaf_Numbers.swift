//
//  Q129_Sum_Root_to_Leaf_Numbers.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 129. Sum Root to Leaf Numbers
 You are given the root of a binary tree containing digits from 0 to 9 only.

 Each root-to-leaf path in the tree represents a number.

 For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
 Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a 32-bit integer.

 A leaf node is a node with no children.

  

 Example 1:


 Input: root = [1,2,3]
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 Example 2:


 Input: root = [4,9,0,5,1]
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.
 */
import XCTest
private class Solution {
var rootToLeaf: Int = 0
func sumNumbers(_ root: TreeNode?) -> Int {
    dfs(root, 0)
    return rootToLeaf
}

func dfs(_ node: TreeNode?, _ sum: Int) {
    var sum = sum
    if node != nil {
        sum = sum * 10 + node!.val
        //if it's a leaf, update root-to-leaf sum
        if node!.left == nil && node!.right == nil {
            rootToLeaf += sum
        }
        
        dfs(node!.left, sum)
        dfs(node!.right, sum)
    }
}
}
class Q129_Sum_Root_to_Leaf_Numbers: XCTestCase {

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
