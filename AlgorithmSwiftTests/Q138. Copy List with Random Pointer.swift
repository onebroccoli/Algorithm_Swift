//
//  Q138. Copy List with Random Pointer.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/7/22.
//
/*
 138. Copy List with Random Pointer
 A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null.

 Construct a deep copy of the list. The deep copy should consist of exactly n brand new nodes, where each new node has its value set to the value of its corresponding original node. Both the next and random pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. None of the pointers in the new list should point to nodes in the original list.

 For example, if there are two nodes X and Y in the original list, where X.random --> Y, then for the corresponding two nodes x and y in the copied list, x.random --> y.

 Return the head of the copied linked list.

 The linked list is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) that the random pointer points to, or null if it does not point to any node.
 Your code will only be given the head of the original linked list.

  

 Example 1:


 Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Example 2:


 Input: head = [[1,1],[2,1]]
 Output: [[1,1],[2,1]]
 Example 3:



 Input: head = [[3,null],[3,0],[3,null]]
 Output: [[3,null],[3,0],[3,null]]
  

 Constraints:

 0 <= n <= 1000
 -104 <= Node.val <= 104
 Node.random is null or is pointing to some node in the linked list.
 */
import XCTest
/*
 

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random  = nil
    }
}


private class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else {
            return nil
        }
        var dummy = Node(-1)
        var head = head
        dummy.next = head
        var dict = [Node:Node?]()
        while let node = head {
            var copyHead = Node(node.val)
            dict[node] = copyHead
            head = node.next
        }
        
        head = dummy.next
        while let node = head {
            var copyHead = dict[node] as? Node
            if let nextNode = node.next {
                copyHead?.next = dict[nextNode] as? Node
            }
            if let randomNode = node.random {
                copyHead?.random = dict[randomNode] as? Node
            }
            head = node.next
        }
        return dict[dummy.next!] as? Node
    }
}
 
 */
class Q138__Copy_List_with_Random_Pointer: XCTestCase {

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
