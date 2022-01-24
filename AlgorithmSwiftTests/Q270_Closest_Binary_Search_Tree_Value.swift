//
//  Q270_Closest_Binary_Search_Tree_Value.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/21/22.
//
/*
 270. Closest Binary Search Tree Value
 Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target.

  

 Example 1:


 Input: root = [4,2,5,1,3], target = 3.714286
 Output: 4
 Example 2:

 Input: root = [1], target = 4.428571
 Output: 1
 */
import XCTest
private class Solution {
func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
    var minValue: Double = Double(Int.max)
    var result: Int = Int.max
    helper(root, target, &minValue, &result)
    return result
}

func helper(_ root: TreeNode?, _ target: Double,  _ min: inout Double, _ result: inout Int) {
    if root == nil {
        return
    }
    helper(root?.left, target, &min, &result)
    if abs(Double(root!.val) - target) < min {
        min = abs(Double(root!.val) - target)
        result = root!.val
    }
    helper(root?.right, target, &min, &result)
}
}
class Q270_Closest_Binary_Search_Tree_Value: XCTestCase {

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
