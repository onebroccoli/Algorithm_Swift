//
//  Q173. Binary Search Tree Iterator.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/3/22.
//
/*
 Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):

 BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
 boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
 int next() Moves the pointer to the right, then returns the number at the pointer.
 Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.

 You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.

  

 Example 1:


 Input
 ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
 [[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
 Output
 [null, 3, 7, true, 9, true, 15, true, 20, false]

 Explanation
 BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
 bSTIterator.next();    // return 3
 bSTIterator.next();    // return 7
 bSTIterator.hasNext(); // return True
 bSTIterator.next();    // return 9
 bSTIterator.hasNext(); // return True
 bSTIterator.next();    // return 15
 bSTIterator.hasNext(); // return True
 bSTIterator.next();    // return 20
 bSTIterator.hasNext(); // return False
  

 Constraints:

 The number of nodes in the tree is in the range [1, 105].
 0 <= Node.val <= 106
 At most 105 calls will be made to hasNext, and next.
  

 Follow up:

 Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?
 */
import XCTest

//Solution1:
//private class BSTIterator {
//    var stack: [TreeNode]
//    init(_ root: TreeNode?) {
//        stack = [TreeNode]()
//        loadAllLeftToStack(from: root)
//    }
//
//    func next() -> Int {
//        let node = stack.removeLast()
//        loadAllLeftToStack(from: node.right)
//        return node.val
//    }
//
//    func hasNext() -> Bool {
//        return !stack.isEmpty
//    }
//
//    func loadAllLeftToStack(from root: TreeNode?) {
//        var node = root
//        while let current = node {
//            stack.append(current)
//            node = current.left
//        }
//    }
//}


//Solution2: inorder traversal
private class BSTIterator {
    var storage: [Int]
    var counter = -1
    
    init(_ root: TreeNode?) {
        storage = [Int]()
        traverseInorder(root)
    }
    
    //traverse in an inorder and store the elements
    func traverseInorder(_ root: TreeNode?) {
        if root == nil {
            return
        }
        traverseInorder(root!.left)
        storage.append(root!.val)
        traverseInorder(root!.right)
    }
    
    func next() ->  Int {
        if hasNext() {
            counter += 1
            return storage[counter]
        }
        return -1
    }
    
    func hasNext() -> Bool {
        if counter < storage.count - 1 {
            return true
        }
        return false
    }
}
class Q173__Binary_Search_Tree_Iterator: XCTestCase {

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
