//
//  Q24_Swap_Nodes_in_Pairs.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/7/22.
//
/*
 Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

  

 Example 1:


 Input: head = [1,2,3,4]
 Output: [2,1,4,3]
 Example 2:

 Input: head = []
 Output: []
 Example 3:

 Input: head = [1]
 Output: [1]

 */
import XCTest
private class Solution {
    //Method1: Recursion
    func swapPairs_recursion(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        //node to be swapped
        var firstNode = head
        var secondNode = head!.next
        
        //swapping
        firstNode!.next = swapPairs_recursion(secondNode!.next)
        secondNode!.next = firstNode
        
        //now the head is the second node
        return secondNode
        
    }
    
func swapPairs_iteration(_ head: ListNode?) -> ListNode? {
    //dummynode acts as the prevNode for the headnode
    //of the list and stores pointer to the head node
    var dummy = ListNode(-1)
    var head = head
    dummy.next = head
    var prevNode = dummy
    while head != nil && head!.next != nil {
        //node to be swapped
        var firstNode = head
        var secondNode = head!.next
        
        //swapping
        prevNode.next = secondNode
        firstNode!.next = secondNode!.next
        secondNode!.next = firstNode
        
        //reinitializing the head and prevNode for the next swap
        prevNode = firstNode!
        head = firstNode!.next
    }
    //return the new head node
    return dummy.next
}
    
}
class Q24_Swap_Nodes_in_Pairs: XCTestCase {

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
