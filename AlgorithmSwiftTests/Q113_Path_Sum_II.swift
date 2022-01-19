//
//  Q113_Path_Sum_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 113. Path Sum II
 Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.
 
 A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.
 
 
 
 Example 1:
 
 
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: [[5,4,11,2],[5,8,4,5]]
 Explanation: There are two paths whose sum equals targetSum:
 5 + 4 + 11 + 2 = 22
 5 + 8 + 4 + 5 = 22
 Example 2:
 
 
 Input: root = [1,2,3], targetSum = 5
 Output: []
 Example 3:
 
 Input: root = [1,2], targetSum = 0
 Output: []
 */
import XCTest
private class Solution{
func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var path: [[Int]] = [[Int]]()
    var nodes: [Int] = [Int]()
    dfs(root, targetSum, &path, &nodes)
    return path
}

func dfs(_ node: TreeNode?, _ sum: Int, _ path: inout [[Int]], _ nodes: inout [Int]) {
    if node == nil {
        return
    }
    //add current node into path list
    nodes.append(node!.val)
    
    if sum == node!.val && node!.left == nil && node!.right == nil {
        path.append(nodes)
    } else {
        dfs(node!.left, sum - node!.val, &path, &nodes)
        dfs(node!.right, sum - node!.val, &path, &nodes)
    }
    
    nodes.removeLast()
}
    
    
}
class Q113_Path_Sum_II: XCTestCase {
    
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
