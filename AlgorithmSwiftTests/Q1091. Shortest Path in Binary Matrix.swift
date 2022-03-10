//
//  Q1091. Shortest Path in Binary Matrix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/9/22.
//
/*
 1091. Shortest Path in Binary Matrix
 Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.

 A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:

 All the visited cells of the path are 0.
 All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
 The length of a clear path is the number of visited cells of this path.

  

 Example 1:


 Input: grid = [[0,1],[1,0]]
 Output: 2
 Example 2:


 Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
 Output: 4
 Example 3:

 Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
 Output: -1
  

 Constraints:

 n == grid.length
 n == grid[i].length
 1 <= n <= 100
 grid[i][j] is 0 or 1
 */
import XCTest
private class Solution {
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        //check start and target cells are open (left top and bottom right are 0
        if grid[0][0] != 0 || grid[grid.count-1][grid[0].count-1] != 0 {
            return -1
        }
        guard grid.count > 0 else {return 0}
        var directions = [[-1,0],[1,0],[0,-1],[0,1], [1,-1], [-1,-1],[1,1],[-1,1]]
        var grid = grid
        var queue: [(Int, Int)] = [(0,0)]
        var count = 1
        //set up bfs
        while !queue.isEmpty {
            let step = queue.count
            for _ in 0..<step {
                let currentStep = queue.remove(at: 0)
                if grid[currentStep.0][currentStep.1] == 1 {continue} //must be 0
                if currentStep.0 == grid.count - 1 && currentStep.1 == grid.count - 1 {
                    return count
                }
                grid[currentStep.0][currentStep.1] = 1
                for direction in directions {
                    let nextStep = (currentStep.0 + direction[0], currentStep.1 + direction[1])
                    if nextStep.0 >= 0 && nextStep.1 >= 0 && nextStep.1 < grid.count && nextStep.0 < grid.count {
                        queue.append(nextStep)
                    }
                }
            }
            count += 1
        }
        return -1
        
    }
    
}
class Q1091__Shortest_Path_in_Binary_Matrix: XCTestCase {

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
