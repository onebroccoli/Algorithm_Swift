//
//  Q207_Course_Schedule.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/10/22.
//
/*
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return true if you can finish all courses. Otherwise, return false.

  

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0. So it is possible.
 Example 2:

 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
  


 */
import XCTest
private class Solution {
//    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//     var graph = Array(repeating: Array(repeating: 0, count: 0), count: numCourses)
//     var courses = Array(repeating: 0, count: numCourses)
//     for i in prerequisites {
//         graph[i[1]].append(i[0]) //rach class, and all classes that needs it as prerequisite
//         courses[i[0]] += 1
//     }
//
//     var q = [Int]()
//     for (i, num) in courses.enumerated() {
//         if num == 0 { q.append(i)}
//     }
//
//     while !q.isEmpty {
//         var t = q.removeLast()
//         for a in graph[t] {
//             courses[a] -= 1
//             if courses[a] == 0 {q.append(a)}
//         }
//
//     }
//
//     return courses.filter{$0 != 0}.count == 0
//
// }
    
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    //DFS
    //all prerequisite pairs must be found
    //we dont need to visit courses with no prerequisites, those can be taken freely
    //we need to construct a graph of courses with prerequisites
    var prereqMap: [Int: [Int]] = [Int:[Int]]() //prerequisite map
    for pair in prerequisites {
        var course = pair[0]
        var prereq = pair[1]
        if prereqMap[course] == nil {
            prereqMap[course] = [Int]()
        }
        prereqMap[course]!.append(prereq)
    }
    //check all courses with prereqs
    for course in prereqMap.keys {
        var seen = Set<Int>()
        var taken = Set<Int>()//add taken set to handle time limit exceeded. we dont need to recheck prereqs for already taken classes
        var didTake = self.takeCourse(course, &seen, &taken, prereqMap)
        if didTake == false {
            return false
        }
        
    }
    return true
    
}

func takeCourse(_ course: Int, _ seen: inout Set<Int>, _ taken: inout Set<Int>, _ prereqMap: [Int:[Int]]) -> Bool {
    //course does not have prereqs
    if prereqMap[course] == nil {
        taken.insert(course)
        return true
    }
    if let prereqs = prereqMap[course]{
        for prereq in prereqs {
            //already took the prereq, skip checking
            if taken.contains(prereq) {
                continue
            }
            if seen.contains(prereq) {
                //we found a cycle, cannot keep going
                return false
            } else {
                seen.insert(course)
                var didTake = takeCourse(prereq, &seen, &taken, prereqMap)
                seen.remove(course)
                if didTake == false {
                    return false
                }
            }
        }
        
    }
    taken.insert(course)
    return true //successfully taken course and all its prereqs
}
}
    class Q207_Course_Schedule: XCTestCase {

   

    func testExample() throws {
        let s = Solution()
        let a = [[1, 0],[2, 1],[3,2]]
        var result = s.canFinish(3, a)
        print("RESULT is: ", result)
    }

    

}
