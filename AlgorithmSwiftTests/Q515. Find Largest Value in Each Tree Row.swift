//
//  Q515. Find Largest Value in Each Tree Row.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/4/22.
//
/*
 515. Find Largest Value in Each Tree Row
 Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

  

 Example 1:


 Input: root = [1,3,2,5,3,null,9]
 Output: [1,3,9]
 Example 2:

 Input: root = [1,2,3]
 Output: [1,3]
  

 Constraints:

 The number of nodes in the tree will be in the range [0, 104].
 -231 <= Node.val <= 231 - 1
 */
import XCTest
private class Solution {
func largestValues(_ root: TreeNode?) -> [Int] {
    guard let root = root else {return []}
    var result = [Int]()
    var queue = [TreeNode]()
    queue.append(root)
    
    while !queue.isEmpty {
        let size = queue.count
        var levelMax = Int.min
        for i in 0..<size {
            let node = queue.removeFirst()
            levelMax = max(levelMax, node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
                
            }
            
        }
        result.append(levelMax)
    }
    return result
}
}

class Q515__Find_Largest_Value_in_Each_Tree_Row: XCTestCase {

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
