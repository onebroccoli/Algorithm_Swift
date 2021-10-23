//
//  Q206_Reverse_Linked_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/4/21.
//
/*
 
 Given the head of a singly linked list, reverse the list, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 Example 2:


 Input: head = [1,2]
 Output: [2,1]
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000
 */
import XCTest
private class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
            var head = head
//            var next: ListNode? = head?.next
            var prev: ListNode? = nil
            while head != nil {
                let next = head!.next
                head?.next = prev
                prev = head
                head = next
                    
            }
            return prev
        }
    
func reverseList_recursive(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var newHead = reverseList_recursive(head?.next)
    head?.next?.next = head
    head?.next = nil
    return newHead
}
}
class Q206_Reverse_Linked_List: XCTestCase {

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
