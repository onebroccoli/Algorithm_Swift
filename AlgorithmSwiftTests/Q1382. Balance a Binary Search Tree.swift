//
//  Q1382. Balance a Binary Search Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/1/22.
//
/*
 1382. Balance a Binary Search Tree
 Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

 A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

  

 Example 1:


 Input: root = [1,null,2,null,3,null,4,null,null]
 Output: [2,1,3,null,null,null,4]
 Explanation: This is not the only correct answer, [3,1,4,null,2] is also correct.
 Example 2:


 Input: root = [2,1,3]
 Output: [2,1,3]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 1 <= Node.val <= 105
 */
import XCTest
private class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var inOrderArray = [Int]()
        getSortedNodesArray(root, &inOrderArray)
        return getBalancedBST(inOrderArray)
    }
    
    
    func getBalancedBinarySearchTree(_ rootsArr: [Int]) -> TreeNode? {
            guard !rootsArr.isEmpty else {
                return nil
            }
            let mid = rootsArr.count/2
            let root = TreeNode(rootsArr[mid])
            root.left = getBalancedBinarySearchTree(Array(rootsArr[0 ..< mid]))
            if (mid + 1) <= (rootsArr.count - 1) {
            root.right = getBalancedBinarySearchTree(Array(rootsArr[mid + 1 ..< rootsArr.count]))
            } else {
                root.right = nil
            }
            return root
        }
    
    //turn the tree into in-order traversal array
    func getSortedNodesArray(_ root: TreeNode?, _ array: inout [Int]){
        guard let root = root else {return}
        getSortedNodesArray(root.left, &array)
        array.append(root.val)
        getSortedNodesArray(root.right, &array)
        
    }
}
class Q1382__Balance_a_Binary_Search_Tree: XCTestCase {

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
