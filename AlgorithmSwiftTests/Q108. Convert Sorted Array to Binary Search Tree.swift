//
//  Q108. Convert Sorted Array to Binary Search Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/3/22.
//
/*
 108. Convert Sorted Array to Binary Search Tree

 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

 A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

  

 Example 1:


 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:


 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,3] and [3,1] are both a height-balanced BSTs.
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
 */
import XCTest
private class Solution {
func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return helper(nums, 0, nums.count - 1)
}

func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    if left > right {
        return nil
    }
    
    //always choose left middle node as a root
    var mid = left + (right - left) / 2
    
    //preorder traversal: node-> left-> right
    var root = TreeNode(nums[mid])
    root.left = helper(nums, left, mid - 1)
    root.right = helper(nums, mid + 1, right)
    return root
}
}
class Q108__Convert_Sorted_Array_to_Binary_Search_Tree: XCTestCase {

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
