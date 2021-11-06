//
//  L_Remove_Certain_Characters.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 11/5/21.
//
/*
 (395). Remove Certain Characters
 Remove given characters in input string, the relative order of other characters should be remained. Return the new string after deletion.
 Assumptions
 The given input string is not null.
 The characters to be removed is given by another string, it is guaranteed to be not null.
 Examples
 input = "abcd", t = "ab", delete all instances of 'a' and 'b', the result is "cd".

 */

private class Solution {
func remove(_ input: String, _ t: String) -> String {
    //assumption: input and t are not null
    //solve it in-place way
    //usually we can convert the immutable string to char[]
    var array = Array(input)
    //get set of all distinct characters in t so that lookup
    //operation will be efficient
    var set : Set<Character> = Set(t)
    //set two pointers slow and fast
    //slow:[0, slow) contains the valid result
    //fast:[fast, array.count) is the area to explore
    var slow = 0
    for fast in 0..<input.count {
        //the exploring character can only be put into valid area if it is not in the set
        if !set.contains(array[fast]) {
            array[slow] = array[fast]
            slow += 1
        }
    }
    //convert the char[] subarray back to string object
    return String(array[0..<slow])
}
    
}





import XCTest

class L_Remove_Certain_Characters: XCTestCase {

   

    func testExample() throws {
        let s = Solution()
        let a = "abcd"
        let b = "ab"
        var res = s.remove(a, b)
        print("===RESULT is ===", res)
    }


}
