//
//  Q876_Middle_of_the_Linked_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/4/21.
//

import XCTest
/*
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 Example 2:


 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  
 */
private class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}


class Q876_Middle_of_the_Linked_List: XCTestCase {

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
