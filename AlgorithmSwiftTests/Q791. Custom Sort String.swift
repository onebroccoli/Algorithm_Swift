//
//  Q791. Custom Sort String.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/16/22.
//
/*
 791. Custom Sort String
 You are given two strings order and s. All the words of order are unique and were sorted in some custom order previously.

 Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

 Return any permutation of s that satisfies this property.

  

 Example 1:

 Input: order = "cba", s = "abcd"
 Output: "cbad"
 Explanation:
 "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a".
 Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.
 Example 2:

 Input: order = "cbafg", s = "abcd"
 Output: "cbad"
 */
import XCTest
private class Solution {
func customSortString(_ order: String, _ str: String) -> String {
    var map: [Character : Int] = [:]
    var charOrder = Array(order)
    var charStr = Array(str)
    var res = ""
    
    //make a hashmap for str, and its count
    for ch in charStr {
        map[ch, default: 0] += 1
    }
    
    //iterate through order string, if its in the map then append the count of characters in the result string first
    for c in charOrder {
        if let count = map[c] {
            for _ in 0..<count {
                res += String(c)
            }
            map[c] = nil
        }
    }
    
    for (c, count) in map {
        for i in 0..<count {
            res += String(c)
        }
    }
    return res
}
}
class Q791__Custom_Sort_String: XCTestCase {

 

    func testExample() throws {
        let s = Solution()
        let order = "cba"
        let str = "abcdewsa"
        let result = s.customSortString(order, str)
        print("Result ==== : ", result)
    }

}
