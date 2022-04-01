//
//  Q863. All Nodes Distance K in Binary Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/31/22.
//
/*
 863. All Nodes Distance K in Binary Tree
 Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.

 You can return the answer in any order.

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
 Output: [7,4,1]
 Explanation: The nodes that are a distance 2 from the target node (with value 5) have values 7, 4, and 1.
 Example 2:

 Input: root = [1], target = 1, k = 3
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [1, 500].
 0 <= Node.val <= 500
 All the values Node.val are unique.
 target is the value of one of the nodes in the tree.
 0 <= k <= 1000
 */
import XCTest

class Q863__All_Nodes_Distance_K_in_Binary_Tree: XCTestCase {

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
