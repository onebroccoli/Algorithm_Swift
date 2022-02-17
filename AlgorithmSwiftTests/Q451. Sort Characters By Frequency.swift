//
//  Q451. Sort Characters By Frequency.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/17/22.
//
/*
 451. Sort Characters By Frequency
 Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

 Return the sorted string. If there are multiple answers, return any of them.

  

 Example 1:

 Input: s = "tree"
 Output: "eert"
 Explanation: 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:

 Input: s = "cccaaa"
 Output: "aaaccc"
 Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:

 Input: s = "Aabb"
 Output: "bbAa"
 Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
  

 Constraints:

 1 <= s.length <= 5 * 105
 s consists of uppercase and lowercase English letters and digits.
 */
import XCTest
private class Solution {
//hashmap + sort
// lowercase uppercase
func frequencySort(_ s: String) -> String {
    var res = ""
    if s == nil || s.count == 0 {
        return res
    }
    
    var strArray = Array(s)
    
    
    
    var map:[Character : Int] = [:]
    for ch in s {
        map[ch, default: 0] += 1
    }
    
    var sorted = map.sorted {
        return $0.value > $1.value
    }
    
    for (key, value) in sorted {
        var freq = value
        while freq > 0 {
            res += String(key)
            freq -= 1
        }
    }
    return res
    
    
}
}
class Q451__Sort_Characters_By_Frequency: XCTestCase {

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
