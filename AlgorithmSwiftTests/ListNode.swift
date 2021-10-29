//
//  ListNode.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/30/21.
//

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static public  func printList(_ head : ListNode?) {
        var curr = head;
        var str = ""
        while curr != nil {
            str += String(curr!.val)
            if curr!.next != nil{
                str += " -> "
            }
            curr = curr!.next
        }
        print(str)
    }
}

