//
//  Q95. Unique Binary Search Trees II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/2/22.
//

/*
 95. Unique Binary Search Trees II
 Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

  

 Example 1:


 Input: n = 3
 Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
 Example 2:

 Input: n = 1
 Output: [[1]]
 */
import XCTest
private class Solution {
func generateTrees(_ n: Int) -> [TreeNode?] {
    if n == 0 {
        return []
    }
    return genTreeList(1, n)
}

func genTreeList(_ start: Int, _ end: Int) -> [TreeNode?] {
    var res: [TreeNode?] = []
    if start > end {
        res.append(nil)
        return res
    } else if start == end {
        var node = TreeNode(start)
        res.append(node)
        return res
    }
    var left: [TreeNode?] = []
    var right: [TreeNode?] = []

    //pick up a root
    for i in start...end {
        //all possible left subtrees if i is chosen to be a root
        var leftList = genTreeList(start, i - 1)
        //all possible right subtrees if i is chosen to be a root
        var rightList = genTreeList(i + 1, end)
        //connect left and right trees to root i
        for left in leftList {
            for right in rightList {
                var root = TreeNode(i)
                root.left = left
                root.right = right
                res.append(root)
            }
        }
    }
    return res
}
    
}
class Q95__Unique_Binary_Search_Trees_II: XCTestCase {

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
