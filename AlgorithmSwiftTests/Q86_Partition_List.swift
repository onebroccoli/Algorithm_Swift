//
//  Q86_Partition_List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/4/21.
//
/*
 Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

 You should preserve the original relative order of the nodes in each of the two partitions.

  

 Example 1:


 Input: head = [1,4,3,2,5,2], x = 3
 Output: [1,2,2,4,3,5]
 Example 2:

 Input: head = [2,1], x = 2
 Output: [1,2]
  

 Constraints:

 The number of nodes in the list is in the range [0, 200].
 -100 <= Node.val <= 100
 -200 <= x <= 200
 */
import XCTest
private class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let smallHead  = ListNode(0)
        let largeHead = ListNode(0)
        var small = smallHead
        var large = largeHead
        var node = head
        while node != nil {
            if node!.val < x {
                small.next = node
                small = small.next!
            } else {
                large.next = node
                large = large.next!
            }
            
            node = node!.next //cant do next on nil, so have to add ! to make it non-optional
        }
        //connect two partitions
        small.next = largeHead.next
        //unlink the last node in large partition
        large.next = nil
        return smallHead.next
    }
}


class Q86_Partition_List: XCTestCase {

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
