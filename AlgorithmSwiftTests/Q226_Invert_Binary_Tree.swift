//
//  Q226_Invert_Binary_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/11/22.
//
/*
 Given the root of a binary tree, invert the tree, and return its root.

  

 Example 1:


 Input: root = [4,2,7,1,3,6,9]
 Output: [4,7,2,9,6,3,1]
 Example 2:


 Input: root = [2,1,3]
 Output: [2,3,1]
 Example 3:

 Input: root = []
 Output: []

 */
import XCTest
private class Solution {
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {return nil}
    var right = invertTree(root.right)
    var left = invertTree(root.left)
    root.left = right
    root.right = left
    return root
}

func invertTree_iteration(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {return nil}
    var q =  [TreeNode]()
    q.append(root)
    while !q.isEmpty {
        var current = q.removeFirst()
        var temp = current.left
        current.left = current.right
        current.right = temp
        if let left = current.left {
            q.append(left)
        }
        if let right = current.right {
            q.append(right)
        }
    }
    return root
}
}
class Q226_Invert_Binary_Tree: XCTestCase {

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
