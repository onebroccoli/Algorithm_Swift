//
//  Q13_Roman_to_Integer.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/31/21.
//
/*
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.

  

 Example 1:

 Input: s = "III"
 Output: 3
 Example 2:

 Input: s = "IV"
 Output: 4
 Example 3:

 Input: s = "IX"
 Output: 9
 Example 4:

 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 5:

 Input: s = "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
  

 Constraints:

 1 <= s.length <= 15
 s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
 It is guaranteed that s is a valid roman numeral in the range [1, 3999].
 */
import XCTest

private class Solution {
    //build a dictionary to store roman letter and number mapping
    let dict: [Character:Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

  
    func romanToInt(_ s: String) -> Int {
        let chars = Array(s)
        var result = 0
        if (chars.count) == 0 {
            return 0
        }
        for i in 0..<chars.count{
            if i == 0 {
                result = dict[chars[i]]!
                continue
            } else {
                let char = chars[i]
                let value = dict[char]!

                let prevChar = chars[i - 1]
                let prevValue = dict[prevChar]!
                result += value
                if value > prevValue {
                    result -= 2 * prevValue
                }
            }
        }
        return result
    }
}


class Q13_Roman_to_Integer: XCTestCase {

    
    func testExample() throws {
        let s = Solution()
        let input = "MCMXCIV" //1994
        let result = s.romanToInt(input)
        print("RESULT IS: ", result)
    }

   

}
