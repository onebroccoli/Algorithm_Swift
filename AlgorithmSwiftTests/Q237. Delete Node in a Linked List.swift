//
//  Q237. Delete Node in a Linked List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/5/22.
//
/*
 237. Delete Node in a Linked List
 Write a function to delete a node in a singly-linked list. You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.

 It is guaranteed that the node to be deleted is not a tail node in the list.

  

 Example 1:


 Input: head = [4,5,1,9], node = 5
 Output: [4,1,9]
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
 Example 2:


 Input: head = [4,5,1,9], node = 1
 Output: [4,5,9]
 Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
  

 Constraints:

 The number of the nodes in the given list is in the range [2, 1000].
 -1000 <= Node.val <= 1000
 The value of each node in the list is unique.
 The node to be deleted is in the list and is not a tail node
 */
import XCTest
private class Solution {
func deleteNode(_ node: ListNode?) {
    node!.val = node!.next!.val
    node?.next = node?.next?.next
}
}
class Q237__Delete_Node_in_a_Linked_List: XCTestCase {

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
