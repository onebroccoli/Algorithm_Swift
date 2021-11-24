//
//  Q1209_Remove_All_K_Adjacent_Duplicates_in_String_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/9/21.
//
/*
 You are given a string s and an integer k, a k duplicate removal consists of choosing k adjacent and equal letters from s and removing them, causing the left and the right side of the deleted substring to concatenate together.

 We repeatedly make k duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It is guaranteed that the answer is unique.

  

 Example 1:

 Input: s = "abcd", k = 2
 Output: "abcd"
 Explanation: There's nothing to delete.
 Example 2:

 Input: s = "deeedbbcccbdaa", k = 3
 Output: "aa"
 Explanation:
 First delete "eee" and "ccc", get "ddbbbdaa"
 Then delete "bbb", get "dddaa"
 Finally delete "ddd", get "aa"
 Example 3:

 Input: s = "pbbcggttciiippooaais", k = 2
 Output: "ps"
  
 */
/*
 Instead of storing counts for each character, we can use a stack. When a character does not match
 the previous one, we push 1 to the stack. Otherwise, we increment the count on the top of the stack.

1. Iterate through the string:
 * if current character is the same as the one before, increment the count on the top of the stack
    - otherwise push 1 to the stack
 * if the count on the top of the stack equals k, erase last k characters and pop from the stack
 */


import XCTest
private class Solution {
//    func removeDuplicates(_ s: String, _ k: Int) -> String {
//        var chars = Array(s)
//        var stack = [Int]()
//        for i in 0..<chars.count {
//            if i == 0 || chars[i] != chars[i - 1] {
//                stack.append(1)
//            } else {
//                var incremented = stack.removeLast() + 1
//                if incremented == k {
//                    chars = chars[0...i - k + 1]
//                    i = i - k
//                } else {
//                    stack.push(incremented)
//                }
//            }
//        }
//    }
//
}



class Q1209_Remove_All_K_Adjacent_Duplicates_in_String_II: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

   
}
