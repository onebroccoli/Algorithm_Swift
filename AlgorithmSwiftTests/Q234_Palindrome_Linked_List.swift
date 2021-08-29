//
//  Q234_Palindrome_Linked_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/5/21.
//
/*
 
 */
import XCTest

private class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true
        }
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        var secondHalfHead = reverse(slow!.next)
        var firstHalfHead = head
        
        
        while secondHalfHead != nil && firstHalfHead != nil {
            guard firstHalfHead!.val == secondHalfHead!.val else {
                return false
            }
            secondHalfHead = secondHalfHead!.next
            firstHalfHead = firstHalfHead!.next
        }
        return true
    }
    func reverse(_ head: ListNode?) -> ListNode? {
        var head = head
        var newHead: ListNode? = nil
        while head != nil {
            let next = head!.next
            head?.next = newHead
            newHead = head
            head = next
        }
        return newHead
    }
}



class Q234_Palindrome_Linked_List: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
