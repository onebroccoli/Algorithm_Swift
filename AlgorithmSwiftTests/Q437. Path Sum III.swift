//
//  Q437. Path Sum III.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/16/22.
//
/*
 437. Path Sum III
 Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.

 The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

  

 Example 1:


 Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 Output: 3
 Explanation: The paths that sum to 8 are shown.
 Example 2:

 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: 3
  

 Constraints:

 The number of nodes in the tree is in the range [0, 1000].
 -109 <= Node.val <= 109
 -1000 <= targetSum <= 1000
 */
//import XCTest
//private class Solution {
//    func pathSum1(_ root: TreeNode?, _ sum: Int) -> Int {
//        guard let root = root else {return 0}
//
//        return dfs(root, sum) + dfs(root.left, sum) + dfs(root.right, sum)
//    }
//    
//    func dfs1(_ root: TreeNode?, _ sum: Int) -> Int {
//        guard let root = root else {return 0}
//        var result = 0
//        if sum == root.val {
//            result += 1
//        }
//        result += dfs(root.left, sum - root.val)
//        result += dfs(root.right, sum - root.val)
//        
//        return result
//    }
//    
//    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
//        var res = 0
//        guard let root = root else {return 0}
//        dfs(root, sum, 0, &res)
//        return res
//    }
//    
//    func dfs(_ root: TreeNode?, _ sum: Int, _ r: Int, _ res: inout Int) {
//        guard let root = root else {return}
//        let currentSum = root.val + r
//        if sum == currentSum {
//            res += 1
//        }
//        
//        
//    }
//    
//}
//class Q437__Path_Sum_III: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
