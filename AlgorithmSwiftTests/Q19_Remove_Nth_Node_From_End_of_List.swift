//
//  Q19_Remove_Nth_Node_From_End_of_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/18/21.
//
/*
 Given the head of a linked list, remove the nth node from the end of the list and return its head.
  
 Example 1:

 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]

 Example 2:
 Input: head = [1], n = 1
 Output: []

 Example 3:
 Input: head = [1,2], n = 1
 Output: [1]

  
 Constraints:
 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
  
 Follow up: Could you do this in one pass?

 */
import XCTest

private class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let node = head, n > 0 else {return nil}
        var listNode = node
        var slowNode = node
        var fastIndex = 0
        var slowIndex = 0
        
        //first move fast to the end, move slow together and keep n gap
        while listNode.next != nil {
            if fastIndex >= n {
                slowIndex += 1
                slowNode = slowNode.next!
            }
            fastIndex += 1
            listNode = listNode.next!
        }
        
        //remove head
        //fastIndex = 0, n = 1
        if n == fastIndex + 1 {
            return slowNode.next
        }
        //remove the underlying node
        slowNode.next = slowNode.next?.next
        return node
    }
}

class Q19_Remove_Nth_Node_From_End_of_List: XCTestCase {

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
