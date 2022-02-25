//
//  Q56. Merge Intervals.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/23/22.
//
/*
 56. Merge Intervals
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  

 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
  

 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 */
import XCTest
private class Solution {
func merge(_ intervals: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    var sorted = intervals.sorted{$0.first! < $1.first!}
    
    for interval in sorted {
        if res.isEmpty || res.last!.last! < interval.first! {
            res.append(interval)
        } else {
            res[res.count - 1] = [res.last!.first!, max(res.last!.last!, interval.last!)]
        }
    }
    return res
}
    
//    func merge(_ intervals: [[Int]]) -> [[Int]] {
//        if intervals.count <= 1 {
//            return intervals
//        }
//
//        var res = [[Int]]()
//        var array = intervals.sorted(by: {$0[0] < $1[0]} )
//
//        var current  = array[0]
//        for interval in array {
//            if interval[0] <= current[1] {
//                current[1] = max(current[1], interval[1])
//            } else {
//                res.append(current)
//                current = interval
//            }
//        }
//        if !res.contains(current) {
//            res.append(current)
//        }
//        return res
//    }
}
class Q56__Merge_Intervals: XCTestCase {

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
