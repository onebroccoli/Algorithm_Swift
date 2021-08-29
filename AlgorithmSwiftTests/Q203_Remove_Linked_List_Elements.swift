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
    if head?.val == val {
        head = head?.next
    }
    return head
}
}

class Q203_Remove_Linked_List_Elements: XCTestCase {

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
