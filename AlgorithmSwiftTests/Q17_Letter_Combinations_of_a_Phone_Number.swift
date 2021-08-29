//
//  Q17_Letter_Combinations_of_a_Phone_Number.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/2/21.
//
/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.



  

 Example 1:

 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:

 Input: digits = ""
 Output: []
 Example 3:

 Input: digits = "2"
 Output: ["a","b","c"]
  

 Constraints:

 0 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 */

//
//import XCTest
//extension StringProtocol  {
//    var digits: [Int] { compactMap(\.wholeNumberValue) }
//}
//
//private class Solution {
//    func combinations(_ digits: String) -> [String] {
//        var result = [String]()
//        guard !digits.isEmpty else { return result}
//
//        let numToChar = ["", "", "abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"]
//        dfs(digits, numToChar, 0, "", &result)
//        return result
//
//    }
//
//    func dfs(_ digits: String, _ numToChar: [String],  _ level: Int, _ current: String, _ result: inout [String]) {
//        //termination case
//        if (level == digits.count) {
//            result.append(current)
//            return
//        }
////        var chars = Array(numToChar[number[level]])
//        let digitString = String(digits[String.Index(encodedOffset: level)])
//        let digit = Int(digitString)
////        let digit = digits.digits[level]
//        let chars = Array(numToChar[digit])
////        let digit = String(digits[String.Index(encodedOffset: level)])
//        if chars.count == 0 {
//            dfs(digits, numToChar, level + 1, current, &result)
//        } else {
//            for char in chars {
//                let newCurrent = current + String(char)
//                dfs(digits, numToChar, level + 1, newCurrent, &result)
//
//            }
//        }
//    }
//}
//
//class Q17_Letter_Combinations_of_a_Phone_Number: XCTestCase {
//
//
//    func testExample() throws {
//        let s = Solution()
//        let result = s.combinations("132")
//        print (result)
//    }
//
//
//}
