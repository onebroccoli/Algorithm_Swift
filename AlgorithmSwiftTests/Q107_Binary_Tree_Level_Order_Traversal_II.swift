//
//  Q107_Binary_Tree_Level_Order_Traversal_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/17/21.
//
/*
 Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[15,7],[9,20],[3]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []

 */
import XCTest
private class Solution {
    func levelOrderBottomBFS(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return []}
        var queue = [TreeNode]()
        var output = [[Int]]()
        queue.append(root)
        
        while queue.isEmpty == false {
            //start new level
            //number of elements in the current level
            var levelCount = queue.count
            var levelNodes = [Int]()
            while levelCount > 0 {
                let node = queue.first!
                queue.removeFirst()
                levelCount -= 1
                levelNodes.append(node.val)
                //add left child node
                if let left = node.left {
                    queue.append(left)
                }
                //add right child node
                if let right = node.right {
                    queue.append(right)
                }
                
            }
            //add nodes by level
            output.append(levelNodes)
        }
        output.reverse()
        return output
    }
func levelOrderBottomDFS(_ root: TreeNode?) -> [[Int]] {
    var output  = [[Int]]()
    guard let root = root else {return output}
    helper(root, 0, &output)
    output.reverse()
    return output
}

private func helper(_ root: TreeNode?, _ level: Int, _ output: inout [[Int]]) {
    //termination
    if output.count == level {
        var temp = [Int]()
        output.append(temp)
    }
    //append current node value
    output[level].append(root!.val)
    
    //process child nodes for the next level
    if let left = root!.left {
        helper(left, level + 1, &output)
    }
    if let right = root!.right {
        helper(right, level + 1, &output)
    }
    
    
}

}
class Q107_Binary_Tree_Level_Order_Traversal_II: XCTestCase {

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
