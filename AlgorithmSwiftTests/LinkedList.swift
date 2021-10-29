//
//  LinkedList.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/25/21.
//

import Foundation

public class LinkedList: CustomStringConvertible {
    var head : ListNode?
    
    //computed property
    public var description: String {
        var desc = ""
        var curr = self.head;
        while curr != nil {
            desc = desc + String(curr!.val)
            if curr!.next != nil {
                desc = desc + "->"
            }
            curr = curr!.next
        }
        return desc
    }
    
    init(_ array: [Int]) {
        let list = array
        let head = ListNode(0)
        var cur : ListNode = head
        for i in list {
            cur.next = ListNode(i)
            if let next = cur.next {
                cur = next
            }
        }
        print("linkedList generated successfully")
        print("value is: =====" ,head.next!.val)
        self.head = head.next
    }
    
    func removeElements(_ val: Int) {
        var head = self.head
        if head == nil {
            return
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
        self.head = head
    }
}


