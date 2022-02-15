//
//  Q252. Meeting Rooms.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/14/22.
//
/*
 252. Meeting Rooms
 Given an array of meeting time intervals where intervals[i] = [starti, endi], determine if a person could attend all meetings.

  

 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: false
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: true
  

 Constraints:

 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti < endi <= 106
 */
import XCTest
private class Solution {
func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.count <= 1 {
        return true
    }
    
    //sort
    let sorted = intervals.sorted(by: {$0[0] < $1[0]} )
    
    for i in 1..<intervals.count {
        if sorted[i][0] < sorted[i - 1][1] {
            return false
        }
    }
    return true
    
}
}
class Q252__Meeting_Rooms: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        let a = [[0,30],[5,10],[15,20]]
        let res = s.canAttendMeetings(a)
        print(res)
    }

   
}
