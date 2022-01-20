//
//  Q257_Binary_Tree_Paths.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/19/22.
//
/*
 257. Binary Tree Paths
 Given the root of a binary tree, return all root-to-leaf paths in any order.

 A leaf is a node with no children.

  

 Example 1:


 Input: root = [1,2,3,null,5]
 Output: ["1->2->5","1->3"]
 Example 2:

 Input: root = [1]
 Output: ["1"]
 */
import XCTest
private class Solution {
var output: [String] = [String]()
func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var s = ""
    if root == nil {
        return [String]() //return empty string
    } else {
        var output: [String] = []
        // var path: String = ""
        dfs(root, "", &output)
        return output
    }
    
}

func dfs(_ root: TreeNode?, _ path: String, _ output: inout [String]){
    if root!.left == nil && root!.right == nil {
        output.append(path + "\(root!.val)")
    }
    
    if root!.left != nil {
        dfs(root!.left, path + "\(root!.val)" + "->", &output)
        
    }
    if root!.right != nil {
        dfs(root!.right, path + "\(root!.val)" + "->", &output)
        
        
    }
}
}
class Q257_Binary_Tree_Paths: XCTestCase {

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
