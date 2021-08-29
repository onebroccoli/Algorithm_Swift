//
//  Q773_Sliding_Puzzle.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/16/21.
//
/*
 On an 2 x 3 board, there are five tiles labeled from 1 to 5, and an empty square represented by 0. A move consists of choosing 0 and a 4-directionally adjacent number and swapping it.

 The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].

 Given the puzzle board board, return the least number of moves required so that the state of the board is solved. If it is impossible for the state of the board to be solved, return -1.

  

 Example 1:


 Input: board = [[1,2,3],[4,0,5]]
 Output: 1
 Explanation: Swap the 0 and the 5 in one move.
 Example 2:


 Input: board = [[1,2,3],[5,4,0]]
 Output: -1
 Explanation: No number of moves will make the board solved.
 Example 3:


 Input: board = [[4,1,2],[5,0,3]]
 Output: 5
 Explanation: 5 is the smallest number of moves that solves the board.
 An example path:
 After move 0: [[4,1,2],[5,0,3]]
 After move 1: [[4,1,2],[0,5,3]]
 After move 2: [[0,1,2],[4,5,3]]
 After move 3: [[1,0,2],[4,5,3]]
 After move 4: [[1,2,0],[4,5,3]]
 After move 5: [[1,2,3],[4,5,0]]
 Example 4:


 Input: board = [[3,2,4],[1,5,0]]
 Output: 14
 */
import XCTest
private class Solution {
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        var res: Int = 0
        var visited =  Set<[[Int]]>()
        var q: [([[Int]], [Int])] = [([[Int]], [Int])]()
        let row = board.count
        let col = board[0].count
        
        var correct  = getCorrectMatrix(row, col)
//        var correct: [[Int]] = [[1, 2, 3],[4, 5, 0]]
        var dirs: [[Int]] = [[0, -1], [-1, 0], [0, 1], [1, 0]]
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == 0 {
                    q.append((board, [i, j]))
                }
            }
        }
        while !q.isEmpty {
            for i in stride(from: q.count - 1, through: 0, by: -1) {
                var t: [[Int]] = q.first!.0  //get the puzzle in [[Int]]
                var zero: [Int] = q.first!.1
                q.removeFirst()
                if t == correct {
                    return res
                }
                visited.insert(t)
                for dir in dirs {
                    var x: Int = zero[0] + dir[0]
                    var y: Int = zero[1] + dir[1]
                    if x < 0 || x >= 2 || y < 0 || y >= 3 {
                        continue
                    }
                    var candidate: [[Int]] = t
                    var temp:Int = candidate[zero[0]][zero[1]]
                    candidate[zero[0]][zero[1]] = candidate[x][y]
                    candidate[x][y] = temp
                    if visited.contains(candidate) {
                        continue
                    }
                    q.append((candidate, [x, y]))
                }
            }
            res += 1
        }
        return -1
    }
    
    
    func getCorrectMatrix(_ row: Int, _ col: Int) -> [[Int]] {
        var correct =  [[Int]]()
        var count = 1
        for i in 0..<row {
            var element = [Int]()
            for j in 0..<col {
                if i == row - 1 && j == col - 1 {
                    element.append(0)
                } else {
                    element.append(count)
                }
                count += 1
            }
            correct.append(element)
        }
        return correct
    }
}



class Q773_Sliding_Puzzle: XCTestCase {
    func testExample() throws {
        let s = Solution()
        var board = [[1,2,3],[4,0,5]]
        let res = s.slidingPuzzle(board)
        print (res)
    }

}
