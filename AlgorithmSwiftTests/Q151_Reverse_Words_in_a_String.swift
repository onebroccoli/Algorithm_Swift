//
//  Q151_Reverse_Words_in_a_String.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/24/21.
//

/*
 
 Given an input string s, reverse the order of the words.

 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

 Return a string of the words in reverse order concatenated by a single space.

 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

  

 Example 1:

 Input: s = "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: s = "  hello world  "
 Output: "world hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: s = "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 Example 4:

 Input: s = "  Bob    Loves  Alice   "
 Output: "Alice Loves Bob"
 Example 5:

 Input: s = "Alice does not even like bob"
 Output: "bob like even not does Alice"

 */

import XCTest

private class Solution {
func reverseWords(_ s: String) -> String {
    if s == nil || s.count == 0 {
        return ""
    }
    var words = s.split(separator: " ", omittingEmptySubsequences: true)
    var res = ""
    for i in stride(from: words.count - 1, to: -1, by: -1){
        if i == 0 {
               res += words[i]
           } else {
               res += words[i]
               res += " "
           }
    }
    return res
}
        
//    func reverseWords(_ s: String) -> String {
//        //convert it char to solve the problem in place
//        var array = Array(s)
//        //1. reverse the whole char array
//        reverse(&array, 0, array.count - 1)
//        var start = 0
//        //2. reverse each of the word
//        for i in 0..<array.count {
//            //define start index of a word
//            if array[i] != " " && (i == 0 || array[i - 1] == " ") {
//                start = i
//            }
//            //define end index of a word
//            if (array[i] != " " && (i == array.count - 1 || array[i + 1] == " ")) {
//                reverse(&array, start, i)
//            }
//        }
//
//        var left = 0
//        var right = array.count - 1
//        while left < right && array[left] == " " {left += 1}
//        while left < right && array[right] == " " {right -= 1}
//
//        return String(array[left...right])
//    }
//
//    func reverse(_ array: inout [Character], _ left: Int, _ right: Int) {
//        var left = left
//        var right = right
//        while left < right {
//            var tmp = array[left]
//            array[left] = array[right]
//            array[right] = tmp
//            left += 1
//            right -= 1
//        }
//    }
    
    func reverseWords2(_ s: String) -> String {
        return String(s.split(separator: " ").reversed().reduce("") { total, word in total + word + " "}.dropLast())
    }
}


class Q151_Reverse_Words_in_a_String: XCTestCase {


    func testExample() throws {
        let s = Solution()
//        var a = "I love Google"
//        var res = s.reverseWords(a)
//        print("RESULT : ======= ",res)
        var b = "  hello world   hdiowhd  "
        var res2 = s.reverseWords(b)

        print("RESULT : ======= ",res2) //should be "world hello"
    }

}
