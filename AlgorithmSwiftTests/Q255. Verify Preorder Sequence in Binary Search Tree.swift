//
//  Q255. Verify Preorder Sequence in Binary Search Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/4/22.
//
/*
 255. Verify Preorder Sequence in Binary Search Tree

 */
import XCTest
private class Solution {
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        var low = Int.min
        var high = Int.min
        
        for (i, value) in preorder.enumerated() {
            if value <= low {
                return false
            }
            
            if value > high {
                low = high
                high = value
            } else {
                var j = i - 1
                while j >= 0 && value > preorder[j] {
                    low = preorder[j]
                    j -= 1
                }
            }
        }
        return true
    }
    
    //stack
    //https://linlaw0229.github.io/2018/08/01/255-Verify-Preorder-Sequence-in-Binary-Search-Tree/
    
func verifyPreorder_Stack(_ preorder: [Int]) -> Bool {
    var stack = [Int]()
    var lower = Int.min
    for n in preorder {
        if n < lower {
            return false
        }
        while !stack.isEmpty && n > stack.last! {
            lower = stack.removeLast()
            
        }
        stack.append(n)
    }
    return true
}
    
    
    
    
    //recursion -- Time very high nlog(n)
    
    func verifyPreorder_recursion(_ preorder: [Int]) -> Bool {
        return dfs(preorder, 0, preorder.count - 1)
    }
    
    func dfs(_ preorder: [Int], _ start: Int, _ end: Int) -> Bool {
        
        if start > end {
            return true
        }
        let root = preorder[start]
        var i = start + 1 //left subtree starting point
        while i <= end && preorder[i] < root {
            i += 1 //until 1st element on right subtree
        }
        for j in i...end {
            if preorder[j] < root {
                return false
            }
        }
        return dfs(preorder, start + 1, i - 1) && dfs(preorder, i, end)
    }

}
class Q255__Verify_Preorder_Sequence_in_Binary_Search_Tree: XCTestCase {

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
