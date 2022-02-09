//
//  Q148. Sort List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/7/22.
//
/*
 148. Sort List
 Given the head of a linked list, return the list after sorting it in ascending order.

  

 Example 1:


 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 Example 2:


 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is in the range [0, 5 * 104].
 -105 <= Node.val <= 105
  

 Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
 */
import XCTest
private class Solution {
    func sortList(_ head: ListNode? ) -> ListNode? {
        guard let head = head else {return nil}
        if head.next == nil {return head} //if only one node, return directly
        let mid = getPrevMidNode(head) //premid
        let midNode = mid?.next
        mid?.next = nil
        return mergeList(sortList(head), sortList(midNode))
    }
    
    func getPrevMidNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else {return nil}
        //current
        var slow: ListNode? = head
        var fast: ListNode? = head.next
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow!.next
            
        }
        return slow
    }
    
    func mergeList(_ head1: ListNode?, _ head2: ListNode? ) -> ListNode? {
        if head1 == nil {return head2}
        if head2 == nil {return head1}
        var l1 = head1
        var l2 = head2
        
        var mergeListNode = ListNode(-1)
        var curr: ListNode? = mergeListNode
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                curr?.next = l1
                l1 = l1!.next
            } else {
                curr?.next = l2
                l2 = l2!.next
            }
            curr = curr?.next
        }
        
        curr?.next = (l1 != nil ? l1 : l2)
        return mergeListNode.next
        
    }
}

class Q148__Sort_List: XCTestCase {

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
