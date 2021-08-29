//
//  Q392_Is_Subsequence.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/11/21.
//

import XCTest
private class Solution {
//target is the main string, s is potential substring
func isSubsequence(_ s: String, _ t: String) -> Bool {
    //corner case
    if s.count > t.count {
        return false
    }
    if s.isEmpty {
        return true
    }
    let arrS = Array(s)
    let arrT = Array(t)
    var i = 0 //s
    var j = 0 //t
    while i < arrS.count && j < arrT.count {
        if arrS[i] == arrT[j] {
            i += 1
            j += 1
        } else {
            j += 1
        }
    }
    return i == arrS.count
    
}
}
class Q392_Is_Subsequence: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.isSubsequence("abc", "ahbgdc")
        print (result)
    }



}
