//
//  Q109. Convert Sorted List to Binary Search Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/3/22.
//
/*
 109. Convert Sorted List to Binary Search Tree
 Given the head of a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

  

 Example 1:


 Input: head = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.
 Example 2:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in head is in the range [0, 2 * 104].
 -105 <= Node.val <= 105
 */
import XCTest
private class Solution {
func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    
    // If the head doesn't exist, then the linked list is empty
    if head == nil {
        return nil
    }
    //find middle element for the list
    var mid: ListNode?  = findMiddle(head)
    
    //turn the mid node to root of the BST
    var node: TreeNode? = TreeNode(mid!.val)
    
    //base case hen there is just one elemnt in the linked list
    if head === mid {
        return node
    }
    //recursively form balanced BSTs using the left and right halves of the original list
    node?.left = sortedListToBST(head)
    node?.right = sortedListToBST(mid!.next)
    return node
    
}

func findMiddle(_ head: ListNode?) -> ListNode? {
    // The pointer used to disconnect the left half from the mid node.
    var prev: ListNode? = nil
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    // Iterate until fast pointerr doesn't reach the end of the linked list.
    while fast != nil && fast!.next != nil {
        prev = slow
        slow = slow!.next
        fast = fast!.next!.next
    }
    // Handling the case when slow pointer was equal to head.
    if prev != nil {
        prev!.next = nil
    }
    return slow
}

}
class Q109__Convert_Sorted_List_to_Binary_Search_Tree: XCTestCase {

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
