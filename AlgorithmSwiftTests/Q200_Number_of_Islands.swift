//
//  Q200_Number_of_Islands.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/18/22.
//
/*
 200. Number of Islands
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

  

 Example 1:

 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:

 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
 */
import XCTest
private class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid == nil || grid.count == 0 {
            return 0
        }
        var rows = grid.count
        var cols = grid[0].count
        var visited: Set<[Int]> = Set<[Int]>()
        var islands = 0
        
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == "1" && !visited.contains([r,c]) {
                    bfs(grid, &visited, r,c,rows, cols, &islands )
                    islands += 1
                }
            }
        }
        return islands
        
    }
    func bfs(_ grid: [[Character]], _ visited: inout Set<[Int]>, _ r: Int, _ c: Int, _ rows: Int, _ cols: Int, _ islands: inout Int) {
        var q: [[Int]] = [[Int]]()
        visited.insert([r, c])
        q.append([r, c])
        while !q.isEmpty{
            var temp: [Int] = q.removeFirst()
            var row = temp[0]
            var col = temp[1]
            var directions: [[Int]] = [[1,0], [-1,0], [0,1],[0, -1]]
            for dir in directions {
                var r = row + dir[0]
                var c = col + dir[1]
                if r >= 0 && r < rows && c >= 0 && c < cols && grid[r][c]=="1" && !visited.contains([r,c]){
                    q.append([r,c])
                    visited.insert([r,c])
                }
            }
        }
    }
    
    
}


//private class Solution {
func numIslands(_ grid: [[Character]]) -> Int {
     if grid == nil || grid.count == 0 {
         return 0
     }
     var grid = grid
     var row = grid.count
     var col = grid[0].count
     var num_islands = 0
     for r in 0..<row {
         for c in 0..<col {
             if grid[r][c] == "1" {
                 num_islands += 1
                 dfs(&grid, r, c, row, col)
             }
         }
     }
     return num_islands
 }

 func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int, _ row: Int, _ col: Int) {
     var row = grid.count
     var col = grid[0].count


     if r < 0 || r >= row || c < 0 || c >= col || grid[r][c] == "0" {
         return
     }

     grid[r][c] = "0"
     dfs(&grid, r - 1, c, row, col)
     dfs(&grid, r + 1, c, row, col)
     dfs(&grid, r, c + 1, row, col)
     dfs(&grid, r, c - 1, row, col)
 }

//}
class Q200_Number_of_Islands: XCTestCase {

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
