//
//  Q987. Vertical Order Traversal of a Binary Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 987. Vertical Order Traversal of a Binary Tree
 Given the root of a binary tree, calculate the vertical order traversal of the binary tree.

 For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).

 The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

 Return the vertical order traversal of the binary tree.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[9],[3,15],[20],[7]]
 Explanation:
 Column -1: Only node 9 is in this column.
 Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
 Column 1: Only node 20 is in this column.
 Column 2: Only node 7 is in this column.
 Example 2:


 Input: root = [1,2,3,4,5,6,7]
 Output: [[4],[2],[1,5,6],[3],[7]]
 Explanation:
 Column -2: Only node 4 is in this column.
 Column -1: Only node 2 is in this column.
 Column 0: Nodes 1, 5, and 6 are in this column.
           1 is at the top, so it comes first.
           5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
 Column 1: Only node 3 is in this column.
 Column 2: Only node 7 is in this column.
 Example 3:


 Input: root = [1,2,3,4,6,5,7]
 Output: [[4],[2],[1,5,6],[3],[7]]
 Explanation:
 This case is the exact same as example 2, but with nodes 5 and 6 swapped.
 Note that the solution remains the same since 5 and 6 are in the same location and should be ordered by their values.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 0 <= Node.val <= 1000
 
 */
//import XCTest
private class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        var queue: [(node: TreeNode?, column: Int)] = []
        var hash: [Int: [Int]] = [:] //map, key is row number, value is [Int] storing the elements for each row.
        
        queue.append((node: root, column: 0))
        while !queue.isEmpty {
            var count = queue.count - 1
            var temp: [Int: [Int]] = [:]
            while count >= 0 {
                let value = queue.removeFirst()
                if let root = value.node {
                    if let left = root.left {
                        queue.append((node: left, column: value.column - 1))
                        
                    }
                    if let right = root.right {
                        queue.append((node: right, column: value.column + 1))
                        
                    }
                    //if temp[column] exists, insert root.val
                    if var isInHash = temp[value.column] {
                        isInHash.append(root.val)
                        temp[value.column] = isInHash //update the temp hash value list
                        //if not exists, append [root.val] directly
                    } else {
                        temp[value.column] = [root.val]
                    }
                }
                count -= 1
            }
            
            if !temp.isEmpty {
                for (key, value) in temp {
                    if var isInHash = hash[key] {
                        isInHash.append(contentsOf: value.sorted())
                        hash[key] = isInHash
                    } else {
                        hash[key] = value.sorted()
                    }
                }
            }
        }
        
        //Formulating the result:
        for key in hash.keys.sorted() {
            if let value = hash[key] {
                result.append(value)
            }
        }
        return result
        
    }
   //[3,9,20,null,null,15,7]
    /*
     

    var map: [Int: [(Int, Int)]] = [:]
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var ans: [[Int]] = []
        helper(root, 0, 0)
        for k in map.keys.sorted() {
            ans.append(map[k]![0])
        }
        return ans
    }

    func helper(_ root: TreeNode?, _ level: Int, _ depth: Int) {
        guard let root = root else {return}
        if map[level] == nil {
            map[level] = [(root.val, depth)]
        } else {
            map[level]!.append((root.val, depth))
        }

        helper(root.right, level + 1, depth + 1)
        helper(root.left, level - 1, depth + 1)


    }
     */

}
//class Q987__Vertical_Order_Traversal_of_a_Binary_Tree: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
