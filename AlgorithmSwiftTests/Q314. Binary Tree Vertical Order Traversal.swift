//
//  Q314. Binary Tree Vertical Order Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/16/22.
//
/*
 314. Binary Tree Vertical Order Traversal
 Given the root of a binary tree, return the vertical order traversal of its nodes' values. (i.e., from top to bottom, column by column).

 If two nodes are in the same row and column, the order should be from left to right.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[9],[3,15],[20],[7]]
 Example 2:


 Input: root = [3,9,8,4,0,1,7]
 Output: [[4],[9],[3,0,1],[8],[7]]
 Example 3:


 Input: root = [3,9,8,4,0,1,7,null,null,null,2,5]
 Output: [[4],[9,5],[3,0,1],[8,2],[7]]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 */
import XCTest
private class Solution {
    //BFS
func verticalOrder(_ root: TreeNode? ) -> [[Int]] {
    guard let root = root else {return []}
    var map: [Int: [Int]] = [:]
    var ans: [[Int]] = []
    var queue: [(TreeNode?, Int)] = [] //record node, index pair
    
    queue.append((root, 0))
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        
        if let node = curr.0 {
            let index = curr.1
            if map[index] != nil {
                map[index]!.append(node.val)
            } else {
                map[index] = [node.val]
            }
            
            queue.append((node.left, index - 1))
            queue.append((node.right, index + 1))
        }
        
    }
    for k in map.keys.sorted() {
        ans.append(map[k]!)
    }
    return ans
}
    
}
class Q314__Binary_Tree_Vertical_Order_Traversal: XCTestCase {

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
