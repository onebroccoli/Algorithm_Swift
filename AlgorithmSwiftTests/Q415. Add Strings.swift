//
//  Q415. Add Strings.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/14/22.
//
/*
 415. Add Strings
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

  

 Example 1:

 Input: num1 = "11", num2 = "123"
 Output: "134"
 Example 2:

 Input: num1 = "456", num2 = "77"
 Output: "533"
 Example 3:

 Input: num1 = "0", num2 = "0"
 Output: "0"
  

 Constraints:

 1 <= num1.length, num2.length <= 104
 num1 and num2 consist of only digits.
 num1 and num2 don't have any leading zeros except for the zero itself.
 */
import XCTest
private class Solution {
func addStrings(_ num1: String, _ num2: String) -> String {
    let chars1: [Character] = Array(num1).reversed()
    let chars2: [Character] = Array(num2).reversed()
    var carry = 0
    var res = [Character]()
    var l1 = 0
    var l2 = 0
    while l1 < chars1.count || l2 < chars2.count || carry == 1{
        let char1 = l1 < chars1.count ? Int(String(chars1[l1]))! : 0
        let char2 = l2 < chars2.count ? Int(String(chars2[l2]))! : 0
        var value = (char1 + char2 + carry) % 10
        carry = (char1 + char2 + carry) / 10
        l1 += 1
        l2 += 1
        res.append(Character(String(value)))
        
        
    }
    return String(res.reversed())
}

//变种 如果带小数点
//32.17
//3.192

//  2 3
//+ 3
// 5 3  reverse 3 5

// 0 7 1
//+2 9 1
// 2 6 3 reverse 3 6 2



func addInteger_withdigit(_ num1: String, _ num2: String) -> String {
    //separate integer and decimal parts
    let number1 = num1.components(separatedBy: ".")
    let ch1:[Character] = Array(number1[0]).reversed()
    var dec1: [Character] = number1.count == 1 ? ["0"] : Array(number1[1]).reversed()
    
    let number2 = num2.components(separatedBy: ".")
    let ch2:[Character] = Array(number2[0]).reversed()
    var dec2: [Character] = number2.count == 1 ? ["0"] : Array(number2[1]).reversed()

    
   
    
    
    
    //process two decimal variables make sure they are same length by adding 0
    
    if dec1.count < dec2.count {
        var i = dec2.count - dec1.count
        while i > 0 {
            dec1.insert("0", at: 0)
            i -= 1
        }
    } else if dec1.count > dec2.count {
        var i = dec1.count - dec2.count
        while i > 0 {
            dec2.insert("0", at: 0)
            i -= 1
        }
    }
    
    //adding two decimal first
    var carry = 0
    var resDecimal = [Character]()
    var j = dec1.count
    if j > 0 {
        for i in 0..<j {
            var int1 = Int(String(dec1[i]))!
            var int2 = Int(String(dec2[i]))!
            var value = (int1 + int2 + carry) % 10
            carry = (int1 + int2 + carry) / 10
            resDecimal.append(Character(String(value)))
        }
    }

    
    //adding integer
    var resInteger = [Character]()
    var l1 = 0
    var l2 = 0
    while l1 < ch1.count || l2 < ch2.count || carry == 1 {
        let char1 = l1 < ch1.count ? Int(String(ch1[l1]))! : 0
        let char2 = l2 < ch2.count ? Int(String(ch2[l2]))! : 0
        var value = (char1 + char2 + carry) % 10
        carry = (char1 + char2 + carry) / 10
        l1 += 1
        l2 += 1
        resInteger.append(Character(String(value)))
    }

    return String(resInteger.reversed() + ["."] + resDecimal.reversed())
    

}
    
}
class Q415__Add_Strings: XCTestCase {

   
    func testExample() throws {
        let s = Solution()
        let a: String = "32.178"
        let b : String = "3.192"
        let result = s.addInteger_withdigit(a, b)
        print("result ======: ", result) //35.362
    }

  

}
