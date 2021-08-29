//
//  Q744_Find_Smallest_Letter_Greater_Than_Target.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/27/21.
//
/*
 744. Find Smallest Letter Greater Than Target
 Given a characters array letters that is sorted in non-decreasing order and a character target, return the smallest character in the array that is larger than target.

 Note that the letters wrap around.

 For example, if target == 'z' and letters == ['a', 'b'], the answer is 'a'.
  

 Example 1:

 Input: letters = ["c","f","j"], target = "a"
 Output: "c"
 Example 2:

 Input: letters = ["c","f","j"], target = "c"
 Output: "f"
 Example 3:

 Input: letters = ["c","f","j"], target = "d"
 Output: "f"
 Example 4:

 Input: letters = ["c","f","j"], target = "g"
 Output: "j"
 Example 5:

 Input: letters = ["c","f","j"], target = "j"
 Output: "c"
  

 Constraints:

 2 <= letters.length <= 104
 letters[i] is a lowercase English letter.
 letters is sorted in non-decreasing order.
 letters contains at least two different characters.
 target is a lowercase English letter.
 */
import XCTest
private class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left = 0
        var right = letters.count
        while left < right {
            let mid = left + (right - left) / 2
            if letters[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return letters[left % letters.count]
    }
}

class Q744_Find_Smallest_Letter_Greater_Than_Target: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
