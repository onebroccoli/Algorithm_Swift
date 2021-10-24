//
//  Q21_Merge_Two_Sorted_Lists.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/30/21.
//
/*
 Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

  

 Example 1:


 Input: l1 = [1,2,4], l2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:

 Input: l1 = [], l2 = []
 Output: []
 Example 3:

 Input: l1 = [], l2 = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both l1 and l2 are sorted in non-decreasing order.

 */
import XCTest

private class Solution {
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    
    let head: ListNode = ListNode(0)
    var tmp = head
    while l1 != nil && l2 != nil {
        let v1 = l1!.val
        let v2 = l2!.val
        if v1 > v2{
            tmp.next = l2!
            l2 = l2?.next
        } else {
            tmp.next = l1!
            l1 = l1?.next
            
        }
        tmp = tmp.next!
    }
    tmp.next = l1 ?? l2
    return head.next
}
//    func reorderList(_ head: ListNode?) {
//        if head == nil {
//            return
//        }
//        //step1: find the middle of the list
//        var slow: ListNode? = head
//        var fast: ListNode? = head
//        while (fast != nil && fast?.next != nil) {
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//        //reverse the second part of the list
//        var prev: ListNode? = nil
//        var curr = slow
//        while curr != nil {
//            var tmp = curr?.next
//            curr?.next = prev
//            prev = curr
//            curr = tmp
//        }
//
//        //merge two sorted linked list
//        var first = head
//        var second = prev
//        while second?.next != nil {
//            var tmp = first?.next
//            first?.next = second
//            first = tmp
//
//            tmp = second?.next
//            second?.next = first
//            second = tmp
//
//        }
//    }
}

class Q21_Merge_Two_Sorted_Lists: XCTestCase {

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
