//
//  Q250_Count_Univalue_Subtrees.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/21/22.
//
/*
 250. Count Univalue Subtrees
 Given the root of a binary tree, return the number of uni-value subtrees.
 A uni-value subtree means all nodes of the subtree have the same value.
  
 Example 1:

 Input: root = [5,1,5,5,5,null,5]
 Output: 4

 Example 2:
 Input: root = []
 Output: 0

 Example 3:
 Input: root = [5,5,5,5,5,null,5]
 Output: 6

 */
import XCTest
private class Solution {
    func countUnivalSubtrees(_ root:TreeNode?) -> Int{
        var b: Bool = true
        return isUnival(root, &b)
    }
    
    func isUnival(_ node: TreeNode?, _ b: inout Bool) -> Int {
        if node == nil {
            return 0
        }
        var left: Bool = true
        var right: Bool = true
        var result: Int = isUnival(node!.left, &left) + isUnival(node!.right, &right)
        b = left&&right
        if node!.left != nil {
            b = b && (node!.val == node!.left!.val)
        } else {
            b = b && true
        }
        
        if node!.right != nil {
            b = b && (node!.val == node!.right!.val)
        } else {
            b = b && true
        }
        var num : Int = b ? 1:0
        return result + num
    }
}
class Q250_Count_Univalue_Subtrees: XCTestCase {

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
