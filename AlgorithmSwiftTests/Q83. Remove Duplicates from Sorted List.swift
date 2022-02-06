//
//  Q83. Remove Duplicates from Sorted List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/4/22.
//
/*
 83. Remove Duplicates from Sorted List
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

  

 Example 1:


 Input: head = [1,1,2]
 Output: [1,2]
 Example 2:


 Input: head = [1,1,2,3,3]
 Output: [1,2,3]
  

 Constraints:

 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */
import XCTest
private class Solution {
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
   var temp = head
    while temp?.next != nil {
        while temp?.val == temp?.next?.val {
            temp?.next = temp?.next?.next
        }
        temp = temp?.next
    }
    return head
}
}
class Q83__Remove_Duplicates_from_Sorted_List: XCTestCase {

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
