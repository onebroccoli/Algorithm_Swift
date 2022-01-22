//
//  Q230_Kth_Smallest_Element_in_a_BST.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/21/22.
//
/*
 230. Kth Smallest Element in a BST

 */
import XCTest
private class Solution {
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var arr: [Int] = [Int]()
    var nums: [Int] = inorder(root, &arr)
    return nums[k-1]
}


func inorder(_ root: TreeNode?, _ arr: inout [Int]) -> [Int] {
    if root == nil {
        return arr
    }
    inorder(root!.left, &arr)
    arr.append(root!.val)
    inorder(root!.right, &arr)
    return arr
    
}
}
class Q230_Kth_Smallest_Element_in_a_BST: XCTestCase {


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

 

}
