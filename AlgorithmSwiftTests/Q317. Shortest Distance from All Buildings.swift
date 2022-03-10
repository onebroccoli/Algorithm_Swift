//
//  Q317. Shortest Distance from All Buildings.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/9/22.
//
/*
 317. Shortest Distance from All Buildings
 You are given an m x n grid grid of values 0, 1, or 2, where:

 each 0 marks an empty land that you can pass by freely,
 each 1 marks a building that you cannot pass through, and
 each 2 marks an obstacle that you cannot pass through.
 You want to build a house on an empty land that reaches all buildings in the shortest total travel distance. You can only move up, down, left, and right.

 Return the shortest travel distance for such a house. If it is not possible to build such a house according to the above rules, return -1.

 The total travel distance is the sum of the distances between the houses of the friends and the meeting point.

 The distance is calculated using Manhattan Distance, where distance(p1, p2) = |p2.x - p1.x| + |p2.y - p1.y|.

  

 Example 1:


 Input: grid = [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
 Output: 7
 Explanation: Given three buildings at (0,0), (0,4), (2,2), and an obstacle at (0,2).
 The point (1,2) is an ideal empty land to build a house, as the total travel distance of 3+3+1=7 is minimal.
 So return 7.
 Example 2:

 Input: grid = [[1,0]]
 Output: 1
 Example 3:

 Input: grid = [[1]]
 Output: -1
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0, 1, or 2.
 There will be at least one building in the grid.
 */

/*
 starting from a house and finding all reachable empty lands.

 If we can reach a house from an empty land, then we can also traverse the other way (i.e., reach empty land from a house).

 When there are fewer houses than empty lands, then this approach will require less time than the previous approach and vice versa. While, on average, this approach is not an improvement on the previous approach, it will serve as a mental stepping stone to better understand the third approach.

 Previously, we were calculating the total minimum distance sum of one empty cell in one BFS traversal, hence we were only returning the distance sum from the BFS function for each cell. But if we start BFS from a house instead of an empty cell, we will be generating partial distance (i.e., distance from only one house to the current cell and not the sum distance from all the houses to this empty cell), hence we need some extra space to store the sum of the partial distances from each house cell.
 
 
 We will need to store 2 values at each cell position of empty cells: total distance sum from all houses to this empty land and number of houses that can reach this empty land.
 
 Algorithm:
 1. for each house cell (value = 1) start a BFS
    - for each empty cell we reach, increase the cell's sum of distances by the steps taken to reach the cell
    - for each empty cell we reach, also increment the cell's house counter 1 (reach[newX][newY] += 1)
 
 2. after traversing all houses, get the minimum distance from all empty cells which have BuildingReached (reach[i][j] equals to total building (buildingNum)
 3. if it is possible for all houses to reach a specific empty land cell, then return the minimum distance found, otherwise, return -1.
 */
import XCTest
private class Solution {
func shortestDistance(_ grid: [[Int]]) -> Int {
    if grid.count == 0 {return 0}
    let row = grid.count
    let col = grid[0].count
    //build a matrix for distance and visited
    var distance = Array(repeating: Array(repeating: 0, count: col), count: row)
    var reach = Array(repeating: Array(repeating: 0, count: col), count: row)
    
    var buildingNum = 0
    let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    for i in 0..<row {
        for j in 0..<col {
            if grid[i][j] != 1 {
                continue
            }
            //find a building = 1
            buildingNum += 1
            var queue = [(i,j)]
            var visited = Array(repeating: Array(repeating: false, count: col), count: row)
            var step = 1
            while queue.count > 0 {
                let size = queue.count
                for _ in 0..<size {
                    let (x,y) = queue.removeFirst()
                    for dir in directions {
                        let newX = x + dir[0]
                        let newY = y + dir[1]
                        //skip rule:
                        //newrow <0, newrow > row -1
                        //newcol <0, newcol > col - 1
                        //visited[newrow][newcol] = true already visited
                        //grid[newrow][newcol] != 0 (value 1,2 all need to skip
                        if newX < 0 || newX == row || newY < 0 || newY == col || visited[newX][newY] || grid[newX][newY] != 0 {
                            continue
                        }
                        distance[newX][newY] += step
                        reach[newX][newY] += 1
                        visited[newX][newY] = true
                        queue.append((newX,newY))
                        
                            
                    }
                }
                step += 1
            }
        }
    }
    var res = Int.max
    for i in 0..<row {
        for j in 0..<col {
            if grid[i][j] == 0 && reach[i][j] == buildingNum {
                res = min(res, distance[i][j])
            }
        }
    }
    return res == Int.max ? -1 : res
    
}
    
}
class Q317__Shortest_Distance_from_All_Buildings: XCTestCase {

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
