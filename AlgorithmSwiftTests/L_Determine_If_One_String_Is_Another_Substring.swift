//
//  Q392_Is_Subsequence.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/11/21.
//

import XCTest
private class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        //corner case
        if s.count < t.count {
            return false
        }
        //return true if t is empty
        if t.isEmpty {
            return true
        }
        
        let length = s.count - t.count + 1
        for i in 0..<length {
            if equals(s, t, i) {
                return true //return i
            }
        }
        return false
    }
    
    func equals(_ s: String, _ t: String, _ start: Int) -> Bool {
        for i in 0..<t.count {
            if Array(s)[i + start] != Array(t)[i] {
                return false
            }
        }
        return true
    }
}
class L_Determine_If_One_String_Is_Another_Substring: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.isSubsequence("bcabc", "bc")
        print (result)
    }
    

}
