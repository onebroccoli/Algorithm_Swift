//
//  L_Insert_In_Sorted_Linked_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/24/21.
//
/*
 Insert a value in a sorted linked list.
 Examples
 L = null, insert 1, return 1 -> null
 L = 1 -> 3 -> 5 -> null, insert 2, return 1 -> 2 -> 3 -> 5 -> null
 L = 1 -> 3 -> 5 -> null, insert 3, return 1 -> 3 -> 3 -> 5 -> null
 L = 2 -> 3 -> null, insert 1, return 1 -> 2 -> 3 -> null

 */
import XCTest
private class Soltution {
func insert(_ head: ListNode? , _ value: Int) -> ListNode? {
    var newNode: ListNode? = ListNode(value)
    //1. determine if inserted node is before head;
    if head == nil || head!.val >= value {
        newNode?.next = head
        return newNode
    }
    
    //2. insert new node to the right position
       //use previous node to traverse the linked list
       //the inserted position should be between prev and prev.next
    var prev = head
    while prev?.next != nil && prev!.next!.val < value {
        prev = prev?.next
    }
    newNode?.next = prev?.next
    prev?.next = newNode
    return head
}
}


class L_Insert_In_Sorted_Linked_List: XCTestCase {


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
