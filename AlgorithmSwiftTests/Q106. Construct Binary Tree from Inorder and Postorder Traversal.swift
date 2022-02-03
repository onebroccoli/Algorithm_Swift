//
//  Q106. Construct Binary Tree from Inorder and Postorder Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/2/22.
//
/*
 106. Construct Binary Tree from Inorder and Postorder Traversal
 Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

  

 Example 1:


 Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
 Output: [3,9,20,null,null,15,7]
 Example 2:

 Input: inorder = [-1], postorder = [-1]
 Output: [-1]
  

 Constraints:

 1 <= inorder.length <= 3000
 postorder.length == inorder.length
 -3000 <= inorder[i], postorder[i] <= 3000
 inorder and postorder consist of unique values.
 Each value of postorder also appears in inorder.
 inorder is guaranteed to be the inorder traversal of the tree.
 postorder is guaranteed to be the postorder traversal of the tree.
 */
import XCTest
private class Solution {
func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    guard inorder.count > 0, postorder.count > 0 else {
        return nil
    }
    
    var map = [Int : Int]()
    for (i, item) in inorder.enumerated() {
        map[item] = i
    }
    
    return helper(map, inorder, postorder, 0, inorder.count, 0, postorder.count )
}


func helper(_ map: [Int : Int], _ inorder: [Int], _ postorder: [Int], _ inLeft: Int, _ inRight: Int, _ posLeft: Int, _ posRight: Int) -> TreeNode? {
    if posLeft >= posRight || inLeft >= inRight {
        return nil
    }
    //select the postorder index element as the root and increment it
    var rootvalue = postorder[posRight - 1]
    var root = TreeNode(rootvalue)
    let rootIndex = map[rootvalue]!
    
    root.left = helper(map, inorder, postorder, inLeft, rootIndex, posLeft, posLeft + rootIndex - inLeft)
    root.right = helper(map, inorder, postorder, rootIndex + 1, inRight, posLeft + (rootIndex - inLeft), posRight - 1)
    return root
}
}
class Q106__Construct_Binary_Tree_from_Inorder_and_Postorder_Traversal: XCTestCase {

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
