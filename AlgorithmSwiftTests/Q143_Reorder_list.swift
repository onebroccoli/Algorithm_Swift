//
//  Q143_Reorder_list.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/24/21.
//
/*
 (41). ReOrder Linked List

 You are given the head of a singly linked-list. The list can be represented as:
 L0 → L1 → … → Ln - 1 → Ln

 Reorder the list to be on the following form:
 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

 You may not modify the values in the list's nodes. Only nodes themselves may be changed.
  
 Example 1:

 Input: head = [1,2,3,4]
 Output: [1,4,2,3]

 Example 2:

 Input: head = [1,2,3,4,5]
 Output: [1,5,2,4,3]

  
 Constraints:
 The number of nodes in the list is in the range [1, 5 * 104].
 1 <= Node.val <= 1000

 */

/*
1 2 3 4
1 2
3 4 -> 4 3
1 4 2 3

1 2 3 4 5
1 2 3
4 5 -> 5 4
1 5 2 4 3


*/

import XCTest

private class Solution {
    
    func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil{
            return
        }
        //1. find middle of the list, even number find the second one
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        //2. reverse the second part of the list
        var prev: ListNode? = nil
        var cur = slow
        while cur != nil {
            var tmp = cur?.next
            cur?.next = prev
            prev = cur
            cur = tmp
        }
        
        //3. merge two sorted linkedlist
        //1 2 3
        //5 4
        var first = head
        var second = prev
        while second?.next != nil {
            var tmp = first?.next
            first?.next = second
            first = tmp
            tmp = second?.next
            second?.next = first
            second = tmp
            
            
        }
        
    }
}


class Q143_Reorder_list: XCTestCase {

 

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
