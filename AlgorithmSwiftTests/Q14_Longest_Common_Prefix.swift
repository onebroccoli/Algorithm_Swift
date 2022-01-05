//
//  Q14_Longest_Common_Prefix.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/4/22.
//




import XCTest
private class Solution {
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var output = strs[0]
    for i in 1..<strs.count {
        output = findCommonPrefix(output, strs[i])
    }
    return output
}


func findCommonPrefix(_ str1: String, _ str2: String) -> String {
    let chars1 = Array(str1)
    let chars2 = Array(str2)
    var output = ""
    var i = 0
    while (i < chars1.count && i < chars2.count && chars1[i] == chars2[i]) {
        output = output + String(chars1[i])
        i += 1
    }
    return output
}
}


class Q14_Longest_Common_Prefix: XCTestCase {

   
    func testExample() throws {
        var s = Solution()
//        var a = ["abbbc","abc","able"]
        var a = ["flower","flow","flight"]
        var result = s.longestCommonPrefix(a)
        print("RESULT======",result)
    }

   

}
