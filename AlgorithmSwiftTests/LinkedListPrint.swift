//
//  LinkedListPrint.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/25/21.
//

import XCTest

private class Solution {
    func generateLinkedList(_ list: [Int]) -> ListNode? {
        var list = list
        var head = ListNode(0)
        var cur : ListNode = head
        for i in list {
            cur.next = ListNode(i)
            if let next = cur.next {
                cur = next
            }
        }
        print("linkedList generated successfully")
        print("value is: =====" ,head.next!.val)
        return head.next
    }
    
    
    func printLinkedList(_ head: ListNode?) {
        var head = head
        while head != nil {
            print(head!.val)
            head = head?.next
        }
    }
    
}


class LinkedListPrint: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let a = [1,2,3,4]
        let b = s.generateLinkedList(a)
        s.printLinkedList(b)
        print("++++++++DONE!!!++++++++")
    }
}
