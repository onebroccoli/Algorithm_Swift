//
//  Q203_Remove_Linked_List_Elements.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/5/21.
//
/*
 Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

  

 Example 1:


 Input: head = [1,2,6,3,4,5,6], val = 6
 Output: [1,2,3,4,5]
 Example 2:

 Input: head = [], val = 1
 Output: []
 Example 3:

 Input: head = [7,7,7,7], val = 7
 Output: []
  

 Constraints:

 The number of nodes in the list is in the range [0, 104].
 1 <= Node.val <= 50
 0 <= val <= 50
 */
import XCTest
private class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        if head == nil {
            return head
        }
        var temp = head?.next
        var prev = head
        while temp != nil {
            if temp?.val == val {
                prev?.next = temp?.next
                temp = prev?.next
            } else {
                temp = temp?.next
                prev = prev?.next
            }
        }
        //post processing: head == val
        if head?.val == val {
            head = head?.next
        }
        return head
    }
}

class Q203_Remove_Linked_List_Elements: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let arr = [1,2,3,4]
        let list = LinkedList(arr)
        let result = s.removeElements(list.head, 3)
        
    }
}
