//
//  Q272_Closest_Binary_Search_Tree_Value_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/23/22.
//
/*
 272. Closest Binary Search Tree Value II
 Given the root of a binary search tree, a target value, and an integer k, return the k values in the BST that are closest to the target. You may return the answer in any order.
 You are guaranteed to have only one unique set of k values in the BST that are closest to the target.
  
 Example 1:

 Input: root = [4,2,5,1,3], target = 3.714286, k = 2
 Output: [4,3]

 Example 2:
 Input: root = [1], target = 0.000000, k = 1
 Output: [1]

  
 Constraints:
 The number of nodes in the tree is n.
 1 <= k <= n <= 104.
 0 <= Node.val <= 109
 -109 <= target <= 109
  
 Follow up: Assume that the BST is balanced. Could you solve it in less than O(n) runtime (where n = total nodes)?


 Hide Hint 1
 Consider implement these two helper functions:
 getPredecessor(N), which returns the next smaller node to N.
 getSuccessor(N), which returns the next larger node to N.
 Hide Hint 2
 Try to assume that each node has a parent pointer, it makes the problem much easier.
 Hide Hint 3
 Without parent pointer we just need to keep track of the path from the root to the current node using a stack.
 Hide Hint 4
 You would need two stacks to track the path in finding predecessor and successor node separately.

 Solution:
 Given target value is a floating point
 You can assume that k always valid, namely: k≤ total node.

 */
import XCTest
private class Solution {
func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
    var res: [Int] = [Int]()
    inorder(root, target,k,&res)
    return res
}

func inorder(_ root: TreeNode?, _ target: Double, _ k: Int, _ res: inout [Int]){
    if root == nil {
        return
    }
    inorder(root?.left, target, k, &res)
    if res.count < k {
        res.append(root!.val)
    } else if abs(Double(root!.val) - target) < abs(Double(res[0]) - target) {
        res.removeFirst()
        res.append(root!.val)
    } else {
        return
    }
    inorder(root?.right, target,k, &res)
}
}
class Q272_Closest_Binary_Search_Tree_Value_II: XCTestCase {

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
