//
//  Q130_Surrounded_Regions.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/14/22.
//
/*
 Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.

  

 Example 1:


 Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
 Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
 Explanation: Surrounded regions should not be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 Example 2:

 Input: board = [["X"]]
 Output: [["X"]]

 */
import XCTest
private class Solution {
    func solve(_ board: inout [[Character]]) {
        //1. select all the cells that are located on the borders of the board
        if board == nil || board.count == 0 {
            return
        }
        var rows = board.count
        var cols = board[0].count
        
        var borders:[[Int]] = [[Int]]()
        for r in 0..<rows {
            borders.append([r, 0]) //left column
            borders.append([r, cols - 1]) //right column
        }
        var newCols = cols - 1
        for c in 0..<newCols {
            borders.append([0, c])
            borders.append([rows - 1, c])
        }
        //2. start from each selected cell, perform dfs traversal, mark the escaped cells
        for i in borders {
            dfs(&board, i[0], i[1], rows, cols)
            
        }
        //2.1 If a cell on the border happens to be O, then we know that this cell              //is alive, together with the other O cells that are connected to this border
        //cell, based on the description of the problem.  Two cells are connected, if there exists a path consisting of only O letter that bridges between the two cells.
        
        
        //Based on the above conclusion, the goal of our DFS traversal would be to mark out all those connected O cells that is originated from the border, with any distinguished letter such as E.
        
        //3. Once we iterate through all border cells, we would then obtain three types of cells:
        //3.1 The one with the X letter: the cell that we could consider as the wall.
        
        //3.2 The one with the O letter: the cells that are spared in our DFS traversal, i.e. these cells has no connection to the border, therefore they are captured. We then should replace these cell with X letter.
        
        //3.3 The one with the E letter: these are the cells that are marked during our DFS traversal, i.e. these are the cells that has at least one connection to the borders, therefore they are not captured. As a result, we would revert the cell to its original letter O.
        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "O" {
                    board[r][c] = "X"
                }
                if board[r][c] == "E" {
                    board[r][c] = "O"
                }
            }
        }
        
    }
    
    //第一版
    func dfs1(_ board: inout [[Character]], _ row: Int, _ col: Int, _ rows: Int, _ cols: Int) {
        if board[row][col] != "O" {
            return
        }
        board[row][col] = "E"
        if col < cols - 1 {
            dfs(&board, row, col + 1, rows, cols)
        }
        if row < rows - 1 {
            dfs(&board, row + 1, col, rows, cols)
        }
        if col > 0 {
            dfs(&board, row, col - 1, rows, cols)
        }
        if row > 0 {
            dfs(&board, row - 1, col, rows, cols)
        }
    }
    //优化版
func dfs(_ board: inout [[Character]], _ row: Int, _ col: Int, _ rows: Int, _ cols: Int) {
   if row < 0 || row >= rows || col < 0 || col >= cols {
       return
   }
    if board[row][col] != "O" {
        return
    }
    board[row][col] = "E"
    //jump to neighbors without boundary checks
    for dir in [[0,1],[1,0],[0,-1],[-1,0]] {
        dfs(&board, row + dir[0], col + dir[1], rows, cols)
    }
    
}
}
class Q130_Surrounded_Regions: XCTestCase {

    func testExample() throws {
        let s = Solution()
//        var input :[[Character]]= [[
//            "X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        var input: [[Character]] = [["X"]]
        s.solve(&input)
        print("RESULT ==== : ", input)
    }

   

}
