//
//  Q67_Add_Binary.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/22/21.
//
/*
 
 Given two binary strings a and b, return their sum as a binary string.

  

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 */
import XCTest

private class Solution{
    func addBinary(_ a: String, _ b: String) -> String{
        var result = [Character]()
        
        let a = Array(a)
        let b = Array(b)
        var indexA = a.count - 1
        var indexB = b.count - 1
        var carry = 0
        while indexA >= 0 || indexB >= 0{
            //a and b may have different length
            let bitA = indexA >= 0 ? Int(String(a[indexA]), radix: 2) : 0
            let bitB = indexB >= 0 ? Int(String(b[indexB]), radix: 2) : 0
            var sum = bitA! + bitB! + carry
            carry = sum / 2
            sum %= 2
            result.insert(Character(String(sum)), at: 0)
            
            
            indexA -= 1
            indexB -= 1
        }
        if carry == 1{
            result.insert(Character(String(carry)), at: 0)
        }
        return String(result)
        
    }
}
class Q67_Add_Binary: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.addBinary("11", "1")
        let expected = "100"
        XCTAssert(result == expected);
    }


}
