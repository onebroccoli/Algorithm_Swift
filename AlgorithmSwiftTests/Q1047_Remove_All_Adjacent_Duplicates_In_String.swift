//
//  Q1047_Remove_All_Adjacent_Duplicates_In_String.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/11/21.
//
/*
 You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

 We repeatedly make duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

  

 Example 1:

 Input: s = "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
 Example 2:

 Input: s = "azxxzy"
 Output: "ay"
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.

 */
import XCTest
private class Solution{
func removeDuplicates(_ s: String) -> String {
    var stack = [Character]()
    for char in s {
        if stack.last == char {
            stack.removeLast()
            
        } else {
            stack.append(char)
        }
        
    }
    return String(stack)
}
    
}
        //two pointer解法不对
//        if s.count <= 1{
//            return s
//        }
//        //convert string to char[] to do it inplace
//        var array = Array(s)
//        //instead of using an extra stack explicitly, reuse the left side of the original char[] as the "stack"
//        //end: is where the top of the stack is.
//        var slow = 0
//        for fast in 1..<array.count {
//            //if the stack is empty(when end == -1) or there is no duplicate chars, push the character into the stack
//            if (slow == -1 || array[fast] != array[slow]) {
//                slow += 1
//                array[slow] = array[fast]
//            } else {
//                //otherwise need to pop the top element by slow pointer -1
//                //ignore all the consecutive duplicate chars
//                slow -= 1
//                while fast + 1 < array.count && array[fast] == array[fast + 1] {
//                    continue
//                }
//            }
//        }
//        return String(array[0..<slow + 1])
    //非该题解，只去除重复字，不连环去除
//    func removeDuplicates(_ s: String) -> String {
//        if s.isEmpty {
//            return s
//        }
//        var array = Array(s)
//        var slow = 0
//        for fast in 0..<array.count {
//            if fast == 0 || array[fast] != array[fast - 1] {
//                array[slow] = array[fast]
//                slow += 1
//            }
//        }
//        return String(array[0, slow + 1])
//    }



class Q1047_Remove_All_Adjacent_Duplicates_In_String: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.removeDuplicates("abbbaaccz")
        print ("result is : ", result)
    }

}
