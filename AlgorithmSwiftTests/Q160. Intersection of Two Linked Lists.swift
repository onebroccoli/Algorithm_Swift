//
//  Q160. Intersection of Two Linked Lists.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/8/22.
//
/*
 160. Intersection of Two Linked Lists

 */
import XCTest
private class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        
        var a: ListNode? = headA
        var b: ListNode? = headB
        while a !== b {
            //nil must be traversed
            if a == nil {
                a = headB
            } else {
                a = a?.next
            }
            
            if b == nil {
                b = headA
            } else {
                b = b?.next
            }
        }
        return a
    }
    
    
}
class Q160__Intersection_of_Two_Linked_Lists: XCTestCase {

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
