//
//  TreeNode.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/13/21.
//

import XCTest

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil

    }
}
