//
//  Q399. Evaluate Division.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/3/22.
//
/*
 399. Evaluate Division
 You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable.

 You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.

 Return the answers to all queries. If a single answer cannot be determined, return -1.0.

 Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

  

 Example 1:

 Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
 Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
 Explanation:
 Given: a / b = 2.0, b / c = 3.0
 queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
 return: [6.0, 0.5, -1.0, 1.0, -1.0 ]
 Example 2:

 Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
 Output: [3.75000,0.40000,5.00000,0.20000]
 Example 3:

 Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
 Output: [0.50000,2.00000,-1.00000,-1.00000]
  

 Constraints:

 1 <= equations.length <= 20
 equations[i].length == 2
 1 <= Ai.length, Bi.length <= 5
 values.length == equations.length
 0.0 < values[i] <= 20.0
 1 <= queries.length <= 20
 queries[i].length == 2
 1 <= Cj.length, Dj.length <= 5
 Ai, Bi, Cj, Dj consist of lower case English letters and digits.
 */
import XCTest
private class Solution {
func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    //corner case
    //1. euqations not empty
    //2. equations and values has same count
    //3. queries not empty
    
    guard equations.count > 0 && equations.count == values.count && queries.count > 0 else {
        return [-1.0]
    }
    
    //construct graph: a-> b   [a:[b, 2]], [b:[a,1/2]]
    var graph: [String: [(String, Double)]] = [:]
    for (index, equation) in equations.enumerated() {
        graph[equation[0], default:[]].append((equation[1], values[index]))
        graph[equation[1], default:[]].append((equation[0], 1/values[index]))
    }
    
    var res:[Double] = []
    for q in queries {
        var visited: Set<String> = Set()
        let val1 = q[0]
        let val2 = q[1]
        if graph[val1] == nil {
            res.append(-1)
        } else {
            let val = dfs(graph, val1, 1.0, val2, &visited)
            res.append(val)
        }
        
    }
    return res
    
    
}
func dfs(_ graph: [String: [(String, Double)]], _ curr: String, _ val: Double, _ search: String, _ visited: inout Set<String>) -> Double {
    if curr == search {return val}
    if visited.contains(curr) {return -1}
    visited.insert(curr)
    if graph[curr] != nil {
        for child in graph[curr]! {
            let val = dfs(graph, child.0, val * child.1, search, &visited)
            if val > -1 {
                return val
            }
        }
    }
    return -1
}
    
    
}
class Q399__Evaluate_Division: XCTestCase {

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
