////
////  Q_All_Permutations_II.swift
////  AlgorithmSwiftTests
////
////  Created by Sophia Zhu on 11/30/21.
////
///*
// L (65). All Permutations II
// Given a string with possible duplicate characters, return a list with all permutations of the characters.
//
// Examples
//
// Set = “abc”, all permutations are [“abc”, “acb”, “bac”, “bca”, “cab”, “cba”]
// Set = "aba", all permutations are ["aab", "aba", "baa"]
// Set = "", all permutations are [""]
// Set = null, all permutations are []
// */
//import XCTest
//
//private class Solution {
//    func permutations(_ input: String) -> [String] {
//        var result : [String] = []
//        if input == nil {
//            return result
//        }
//        var array = Array(input)
//        helper(&array, 0, &result)
//        return result
//    }
//
//    func helper(_ array: inout [Character], _ index: Int, _ result: inout [String]) {
//        if index == array.count {
//            result.append(String(array))
//            return
//        }
//
//        var used : Set<Character> = []
//        for i in 0..<array.count {
//            if let used.insert(array[i]) {
//                array.swapAt(i, index)
//                helper(&array, index + 1, &result)
//            }
//        }
//    }
//
//
//
//}
//
//
//class Q_All_Permutations_II: XCTestCase {
//
//
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//
//}
