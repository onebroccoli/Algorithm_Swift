//
//  Q249. Group Shifted Strings.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/9/22.
//
/*
 249. Group Shifted Strings
 We can shift a string by shifting each of its letters to its successive letter.

 For example, "abc" can be shifted to be "bcd".
 We can keep shifting the string to form a sequence.

 For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".
 Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.

  

 Example 1:

 Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
 Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
 Example 2:

 Input: strings = ["a"]
 Output: [["a"]]
  

 Constraints:

 1 <= strings.length <= 200
 1 <= strings[i].length <= 50
 strings[i] consists of lowercase English letters.
 */
import XCTest
private class Solution {
func groupStrings(_ strings: [String]) -> [[String]] {
    var map = [String: [String]]()
    var result = [[String]]()
    for s in strings {
        map[hash(of: s), default: [String]()].append(s)
        
    }
    map.values.map {result.append($0)}
    return result
}


func hash(of s: String) -> String {
    var hashArray = [Int]()
    var chars = Array(s)
    for i in 1..<chars.count {
        var diff = toInt(chars[i]) - toInt(chars[i-1])
        if diff < 0 {
            diff += 26
        }
        hashArray.append(diff%26)
    }
    return hashArray.map{String($0)}.joined(separator: "-")
}

func toInt(_ c: Character) -> Int {
    return Int(c.asciiValue! - Character("a").asciiValue!)
}
}
class Q249__Group_Shifted_Strings: XCTestCase {



    func testExample() throws {
        let s = Solution()
        let a: [String] = ["abc","bcd","acef","xyz","az","ba","a","z","al"]
        let result = s.groupStrings(a)
        print("RESULT: == ", result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
