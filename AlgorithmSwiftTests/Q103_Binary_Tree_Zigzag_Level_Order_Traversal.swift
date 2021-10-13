//
//  Q103_Binary_Tree_Zigzag_Level_Order_Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/10/21.
//
/*
 
 */
import XCTest

private class Solution {
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {return []}
    var queue = [TreeNode]()
    var output = [[Int]]()
    queue.append(root)
    var level = 0
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

    if level % 2 == 0 {
        output.append(levelNodes)
    } else {
        output.append(levelNodes.reversed())
    }
    level += 1
}

    return output
}
    
}



class Q103_Binary_Tree_Zigzag_Level_Order_Traversal: XCTestCase {

   

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
