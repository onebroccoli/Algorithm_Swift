//
//  TreeNode.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/13/21.
//

import Foundation



//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public var next: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; self.next = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; self.next = nil}
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?, _ next: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.next = next
    }
}
