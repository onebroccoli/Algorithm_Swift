//
//  Q125_Valid_Palindrome.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/23/21.
//

import XCTest

private class Solution{
//    func isPalindrome(_ s: String) -> Bool {
//        guard !s.isEmpty else {return true} //if s.isEmpty {return true}
//        let array = Array(s.lowercased())
//        var left = 0
//        var right = array.count - 1
//        while left < right {
//            while left < right && !array[left].isAlphanumeric {
//                left += 1
//            }
//            while left < right && !array[right].isAlphanumeric {
//                right -= 1
//            }
//            guard array[left] == array[right] else {
//                return false
//            }
//            left += 1
//            right -= 1
//        }
//        return true
//    }
//
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var i = 0
        var j = chars.count - 1
        while i < j {
            if !chars[i].isLetter && !chars[i].isNumber {
                i += 1
            } else if !chars[j].isLetter && !chars[j].isNumber {
                j -= 1
            } else if String(chars[i]).lowercased() == String(chars[j]).lowercased(){
                i += 1
                j -= 1
            } else {
                return false
            }
        }
        return true
    }
}
extension Character{
    var isAlphanumeric: Bool {
        return isWholeNumber || isLetter
    }
}


class Q125_Valid_Palindrome: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        let result = s.isPalindrome("RAcecar")
        let expected = true
        XCTAssert(result == expected);
    }


}
