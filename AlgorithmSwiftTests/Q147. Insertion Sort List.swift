//
//  Q147. Insertion Sort List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/8/22.
//
/*
 147. Insertion Sort List
 Given the head of a singly linked list, sort the list using insertion sort, and return the sorted list's head.

 The steps of the insertion sort algorithm:

 Insertion sort iterates, consuming one input element each repetition and growing a sorted output list.
 At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list and inserts it there.
 It repeats until no input elements remain.
 The following is a graphical example of the insertion sort algorithm. The partially sorted list (black) initially contains only the first element in the list. One element (red) is removed from the input data and inserted in-place into the sorted list with each iteration.


  

 Example 1:


 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 Example 2:


 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
  

 Constraints:

 The number of nodes in the list is in the range [1, 5000].
 -5000 <= Node.val <= 5000
 */
import XCTest
private class Solution {
func insertionSortList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var dummy: ListNode? = ListNode(-1)
    var curr: ListNode? = head
    
    while curr != nil {
        //at each iteration, insert an element into the resulting list
        var prev: ListNode? = dummy
        //find the position to insert the current node
        while prev?.next != nil && prev!.next!.val < curr!.val {
            prev = prev?.next
        }
        //when prev.next > curr.val we need to insert
        var next: ListNode? = curr?.next
        //insert
        curr?.next = prev?.next
        prev?.next = curr
        
        //move on to the next iteration
        curr = next
    }
    return dummy?.next
}
}
class Q147__Insertion_Sort_List: XCTestCase {

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
