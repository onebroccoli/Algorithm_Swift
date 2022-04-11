//
//  Q778. Swim in Rising Water.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/8/22.
//
/*
 778. Swim in Rising Water

 */
import XCTest
private class Solution {
func swimInWater(_ grid: [[Int]]) -> Int {
    var n = grid.count
    var left = grid[0][0]
    var right = n * n
    while left < right {
        var mid = left + (right - left) / 2
        if !helper(grid, mid) {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
    
}

private func helper(_ grid: [[Int]], _ mid: Int) -> Bool {
    var n = grid.count
    var visited = Set<Int>()
    var dirs: [[Int]] = [[0,-1], [0,1],[1,0], [-1, 0]]
    var stack =  [Int]()
    stack.append(0)
    while !stack.isEmpty {
        var temp = stack.removeLast()
        var i = temp / n
        var j = temp % n
        if i == n - 1 && j == n - 1 {
            return true
        }
        for dir in dirs {
            var x = i + dir[0]
            var y = j + dir[1]
            if x < 0 || x >= n || y < 0 || y >= n || visited.contains(x * n + y) || grid[x][y] > mid {
                continue
            }
            stack.append(x * n + y)
            visited.insert(x * n + y)
        }
    }
    return false
}
}
class Q778__Swim_in_Rising_Water: XCTestCase {

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
