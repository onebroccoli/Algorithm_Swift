//
//  Q105. Construct Binary Tree from Preorder and Inorder Traversal.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/2/22.
//
/*
 105. Construct Binary Tree from Preorder and Inorder Traversal

 */
import XCTest
private class Solution {
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    //utilizing the inOrder sequence to determine the size of left/right subtrees
    //assumption: pre, in are not null, there is no duplicates in the binary tree,
    // the length of pre and inorder are guaranteed to be the same
    guard preorder.count > 0, inorder.count > 0 else {
        return nil
    }
    
    //build the dictionary for inorder, key is the value, value is the index
    var map = [Int : Int]()
    for (i, item) in inorder.enumerated() {
        map[item] = i
    }
    
    
    return helper(map, preorder, inorder, 0, preorder.count - 1, 0, inorder.count - 1)
    
}

func helper(_ map: [Int : Int], _ preorder: [Int], _ inorder: [Int], _ preLeft: Int, _ preRight: Int, _ inLeft: Int, _ inRight: Int) -> TreeNode? {
    if preLeft > preRight {
        return nil
    }
    //select the preorder index element as the root and increment it
    var root = TreeNode(preorder[preLeft])
    let rootIndex = map[preorder[preLeft]]!
    let leftNum = rootIndex - inLeft
    
    //build left and right subtree
    //excluding map[rootValue] element because it's the root
    root.left = helper(map, preorder, inorder, preLeft + 1, preLeft + leftNum, inLeft, rootIndex - 1)
    root.right = helper(map, preorder, inorder, preLeft + leftNum + 1, preRight, rootIndex + 1, inRight)
    
    return root
}

}
class Q105__Construct_Binary_Tree_from_Preorder_and_Inorder_Traversal: XCTestCase {

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
