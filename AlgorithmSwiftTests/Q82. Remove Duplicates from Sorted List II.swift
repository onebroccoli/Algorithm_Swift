//
//  Q82. Remove Duplicates from Sorted List II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/4/22.
//
/*
 82. Remove Duplicates from Sorted List II

 */
import XCTest
private class Solution {
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var dummy: ListNode? = ListNode(0)
    dummy?.next = head
    var node: ListNode? = head
    var prev: ListNode? = dummy
    while node != nil {
        var dupFlag = false
        
        while node?.next != nil && node?.val == node?.next?.val {
            node = node?.next
            dupFlag = true
        }
        if dupFlag {
            prev?.next = node?.next
            
        } else {
            prev = prev?.next
        }
        node = node?.next
    }
    return dummy?.next
}
}
class Q82__Remove_Duplicates_from_Sorted_List_II: XCTestCase {

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
