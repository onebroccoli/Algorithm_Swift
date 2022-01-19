//
//  Q199_Binary_Tree_Right_Side_View.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/14/22.
//
/*
 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

  

 Example 1:


 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]
 Example 2:

 Input: root = [1,null,3]
 Output: [1,3]
 Example 3:

 Input: root = []
 Output: []
 */
import XCTest
private class Colution {

func rightSideView(_ root: TreeNode?) -> [Int] {
    if let root = root {
        var result: [Int] = []
        var current: [TreeNode] = [root]
        var next: [TreeNode] = []
        
        while !current.isEmpty {
            if current.count == 1 {
                result.append(current[0].val)
            }
            
            let node = current.removeFirst()
            if let left = node.left {
                next.append(left)
            }
            if let right = node.right {
                next.append(right)
            }
            //when current level is finished , move to next level (next, update next to empty
            if current.count == 0 {
                current = next
                next = []
            }
        }
        return result
        
    } else {
        return []
    }
}
}
class Q199_Binary_Tree_Right_Side_View: XCTestCase {

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
