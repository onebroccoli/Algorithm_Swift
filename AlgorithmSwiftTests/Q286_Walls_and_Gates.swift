//
//  Q286_Walls_and_Gates.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/12/22.
//
/*
 286. Walls and Gates

 You are given an m x n grid rooms initialized with these three possible values.

 -1 A wall or an obstacle.
 0 A gate.
 INF Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
 Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

  

 Example 1:


 Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
 Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
 Example 2:

 Input: rooms = [[-1]]
 Output: [[-1]]
 */
import XCTest
private class Solution {
func wallsAndGates(_ rooms: inout [[Int]]) {
    for i in 0..<rooms.count {
        for j in 0..<rooms[i].count {
            if rooms[i][j] == 0 {
                dfs(&rooms, i, j, 0)
            }
        }
    }
}

func dfs(_ rooms: inout[[Int]], _ i: Int, _ j: Int, _ val: Int){
    if i < 0 || i >= rooms.count || j < 0 || j >= rooms[i].count || rooms[i][j] < val {
        return
    }
    rooms[i][j] = val
    dfs(&rooms, i + 1, j, val + 1)
    dfs(&rooms, i - 1, j, val + 1)
    dfs(&rooms, i, j + 1, val + 1)
    dfs(&rooms, i, j - 1, val + 1)
}
}
class Q286_Walls_and_Gates: XCTestCase {

    func testExample() throws {
        let s = Solution()
        var rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
        s.wallsAndGates(&rooms)
        print("RESULT is ====",rooms) //[[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
    }


}
