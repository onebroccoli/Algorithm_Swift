//
//  Q61. Rotate List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/5/22.
//
/*
 61. Rotate List
 Given the head of a linked list, rotate the list to the right by k places.

  

 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [4,5,1,2,3]
 Example 2:


 Input: head = [0,1,2], k = 4
 Output: [2,0,1]
  
 */
import XCTest
private class Solution {
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    //count length
    var len = 0
    var prev = head
    var last = prev
    while prev != nil {
        len += 1
        last = prev
        prev = prev!.next
    }
    
    if len == 0 || len == 1 {
        return head
    }
    //rotate
    let dummyHead = ListNode(0)
    dummyHead.next = head
    prev = dummyHead
    for _ in 0..<(len - k % len) % len {
        prev = prev!.next
    }
    let newHead = prev!.next
    prev!.next = nil
    last!.next = dummyHead.next
    
    return newHead
    }
}
class Q61__Rotate_List: XCTestCase {

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
