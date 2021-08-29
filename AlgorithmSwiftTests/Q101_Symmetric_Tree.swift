//
//  Q101_Symmetric_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/13/21.
//

import XCTest
@testable import AlgorithmSwift

private class Solution{
func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    return helper(root.left, root.right)
}
private func helper(_ left : TreeNode?, _ right : TreeNode?) -> Bool{
    if (left == nil && right == nil){
        return true
    }
    //两个let
    if let left = left, let right = right, left.val == right.val{
        return helper(left.left, right.right) && helper(left.right, right.left)
    } else {
        return false
    }
}
}

class Q101_Symmetric_Tree: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    

}
