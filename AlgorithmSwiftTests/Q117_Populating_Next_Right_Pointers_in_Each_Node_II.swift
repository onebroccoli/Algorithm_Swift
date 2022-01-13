//
//  Q117_Populating_Next_Right_Pointers_in_Each_Node_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/10/22.
//
/*
 Given a binary tree

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Example 1:


 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 Example 2:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 6000].
 -100 <= Node.val <= 100
  

 Follow-up:

 You may only use constant extra space.
 The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.
 */
import XCTest
//跟Q116_Populating_Next_Right_Pointers_in_Each_Node一样

//private class Solution {
//    func connect(_ root: TreeNode?) -> TreeNode? {
//        guard let root = root else {return nil}
//        //initiate an array which contains just the root of the tree
//        var q = [TreeNode]()
//        q.append(root)
//        //outer while loop which iterates over each level
//        while q.count > 0 {
//            //note the size of the queue
//            var size : Int = q.count
//            //iterate over all the nodes on the current level
//            for i in 0..<size {
//                let node = q.removeFirst()
//                //pop a node from the front of the queue
//                if i < size - 1 {
//                    node.next = q.first!
//
//                }
//                //add the children if any to the back of the queue
//                if let left = node.left {
//                    q.append(left)
//                }
//                //add right child node
//                if let right = node.right {
//                    q.append(right)
//                }
//
//            }
//        }
//        return root
//    }
//}
class Q117_Populating_Next_Right_Pointers_in_Each_Node_II: XCTestCase {

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
