//
//  Q92. Reverse Linked List II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/5/22.
//
/*
 92. Reverse Linked List II
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [5], left = 1, right = 1
 Output: [5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n
  

 Follow up: Could you do it in one pass?
 */
import XCTest
private class Solution {
func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    var left = left, right = right, head = head
    //corner case
    if head?.next == nil {
        return head
    }
    if left == right {
        return head
    }
    if head == nil {
        return nil
    }
    
    //move the two pointers, until they reach the proper starting point in the list
    
    var cur: ListNode? = head
    var prev: ListNode? = nil
    while left > 1 {
        prev = cur
        cur = cur?.next
        left -= 1
        right -= 1
    }
    
    //the two pointers that will fix the final connection
    var newHead: ListNode? = prev
    var tail: ListNode? = cur
    
    //the two pointers reverse the nodes until n becomes 0
    var next: ListNode? = nil
    while right > 0 {
        next = cur?.next
        cur?.next = prev
        prev = cur
        cur = next
        right -= 1
    }
    
    //adjust the final connections as explained in the algorithm
    if newHead != nil {
        newHead?.next = prev
    } else {
        head = prev //if start reversing from beginning, head = prev directly
    }
    tail?.next = cur
    return head
    
    
}
}
class Q92__Reverse_Linked_List_II: XCTestCase {

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
