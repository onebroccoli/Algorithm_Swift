//
//  Q253. Meeting Rooms II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/22/22.
//
/*
 253. Meeting Rooms II
 Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

  

 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: 1
  

 Constraints:

 1 <= intervals.length <= 104
 0 <= starti < endi <= 106
 */
import XCTest
private class Solution {
func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    //corner cases
    if intervals.count == 0 {
        return 0
    }
    if intervals.count == 1{
        return 1
    }
    
    //sort all start time points and all end time points in two arrays
    let startIntervals = intervals.sorted(by: {$0[0] < $1[0]}).map({$0[0]})
    let endIntervals = intervals.sorted(by: {$0[1] < $1[1]}).map({$0[1]})
    
    var rooms = 0
    // var result = 0
    var start = 0
    var end = 0
    
    while start < startIntervals.count {
        let s = startIntervals[start]
        let e = endIntervals[end]
        
        if s < e { //if start is before end, then need 1 room ++, and  start pointer ++
            rooms += 1
            start += 1
        } else {//if start >= ending, then we can use the same conference room. end++
            start += 1
            end += 1
        }
        
        // result = max(result, rooms)
    }
    return rooms
}
}
class Q253__Meeting_Rooms_II: XCTestCase {

   
    func testExample() throws {
        let s = Solution()
//        let a = [[0,30],[5,10],[15,20]]
        let b = [[1,5],[8,9],[8,9]]
        let res = s.minMeetingRooms(b)
        print("res: === ",res)
    }

   
}
