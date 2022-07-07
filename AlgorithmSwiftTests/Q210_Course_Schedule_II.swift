//
//  Q210_Course_Schedule_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/13/22.
//
/*
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

  

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
 Example 2:

 Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
 Example 3:

 Input: numCourses = 1, prerequisites = []
 Output: [0]
  

 Constraints:

 1 <= numCourses <= 2000
 0 <= prerequisites.length <= numCourses * (numCourses - 1)
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 ai != bi
 All the pairs [ai, bi] are distinct.
 */
import XCTest

//Solution 1:

//private class Solution {
//func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
//
//    /**
//    Create a graph of empty arrays for each course.
//    The graph represents each courses goal.
//    For example: I need this course to be able to do XY.
//    I need to finish course 2 to be able to do courses [3,4]
//    */
//    var graph: [[Int]] = Array(repeating: [], count: numCourses)
//
//    // Iterate through the prerequisites to fill the graph
//    for element in prerequisites {
//
//        // Set for each requirement the course you can do once done
//        graph[element[1]].append(element[0])
//    }
//
//    /**
//    Init a visiting and visited array.
//    Both representing the total amount of courses and both
//    implemented false to begin with.
//    */
//    var visiting: [Bool] =  Array(repeating: false, count: numCourses)
//    var visited: [Bool] =  Array(repeating: false, count: numCourses)
//    var result: [Int] = []
//
//    // Iterate through each course
//    for course in 0..<numCourses {
//
//        // And check if we can find a circle
//        if foundCircle(in: graph, at: course, visiting: &visiting, visited: &visited, result: &result) {
//            return []
//        }
//    }
//
//    /**
//    The result array is in descending order
//    starting from the last node of the DFS.
//    So we need to reverse it.
//    */
//    return result.reversed()
//}
//
//private func foundCircle(in graph: [[Int]],
//                        at course: Int,
//                        visiting: inout [Bool],
//                        visited: inout [Bool],
//                        result: inout [Int]) -> Bool {
//
//    /**
//    If we are currently visiting the neighbors of this course,
//    it means that we have found a circle.
//    Example: Course 0 requires course 1, and course 1 course 0.
//    */
//    if visiting[course] == true {
//        return true
//    }
//
//    /**
//    If we have already visited this node, we know it's fine
//    and we can return true. There can't be a circle
//    otherwise we would have never successfully visited it.
//    */
//    if visited[course] == true {
//        return false
//    }
//
//    /**
//    Set the current node to visiting,
//    to be able to catch it above on the recursion
//    */
//    visiting[course] = true
//
//    // Iterate through the current node's neighbors
//    for neighbor in graph[course] {
//
//        // If we find a circle, return true
//        if foundCircle(in: graph, at: neighbor, visiting: &visiting, visited: &visited, result: &result) {
//            return true
//        }
//    }
//
//    // Append the current node
//    result.append(course)
//
//    // Set the visiting back to false
//    visiting[course] = false
//
//    // And update the visitation
//    visited[course] = true
//    return false
//}
//
//}

//Solution 2:

private class Solution {
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var visited = [Int: Bool]()
    var cycle = [Int: Bool]()
    var courseMap = [Int: [Int]]()
    var output = [Int]()
    for pre in prerequisites {
        courseMap[pre[0], default: [Int]()].append(pre[1])
    }
    
    
    
    for course in 0..<numCourses {
        if !dfs(course, &visited, &cycle, &output, courseMap) {
            return []
        }
    }
    
    return output
}


func dfs(_ course: Int, _ visited: inout [Int: Bool], _ cycle: inout [Int: Bool], _ output: inout [Int], _ courseMap: [Int: [Int]]) -> Bool {
    if visited[course] != nil {
        return true
    }
    if cycle[course] != nil {
        return false
    }
    
    if let pre = courseMap[course] {
        cycle[course] = true
        for prerequisite in pre {
            if !dfs(prerequisite, &visited, &cycle, &output, courseMap) {
                return false
            }
        }
        cycle[course] = nil
    }
    visited[course] = true
    output.append(course)
    return true
}
}
class Q210_Course_Schedule_II: XCTestCase {

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
