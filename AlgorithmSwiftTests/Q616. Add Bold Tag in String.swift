//
//  Q616. Add Bold Tag in String.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/13/22.
//
/*
 616. Add Bold Tag in String
 You are given a string s and an array of strings words. You should add a closed pair of bold tag <b> and </b> to wrap the substrings in s that exist in words. If two such substrings overlap, you should wrap them together with only one pair of closed bold-tag. If two substrings wrapped by bold tags are consecutive, you should combine them.

 Return s after adding the bold tags.

  

 Example 1:

 Input: s = "abcxyz123", words = ["abc","123"]
 Output: "<b>abc</b>xyz<b>123</b>"
 Example 2:

 Input: s = "aaabbcc", words = ["aaa","aab","bc"]
 Output: "<b>aaabbc</b>c"
  

 Constraints:

 1 <= s.length <= 1000
 0 <= words.length <= 100
 1 <= words[i].length <= 1000
 s and words[i] consist of English letters and digits.
 All the values of words are unique.
  

 Note: This question is the same as 758: https://leetcode.com/problems/bold-words-in-string/
 */
import XCTest
private class Solution {
    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        guard !s.isEmpty else {return ""}
        let s = Array(s)
        let n = s.count
        var mask = [Bool](repeating: false, count: n)
        
        for i in 0..<n {
        search: for word in dict {
            for (k, w) in word.enumerated() {
                guard k + i >= n || s[k+i] != w else {continue}
                continue search
            }
            
            for j in i..<i+word.count {
                mask[j] = true
            }
        }
        }
        var ans = [String]()
        for i in 0..<n {
            if mask[i], (i == 0 || !mask[i - 1]) {
                ans.append("<b>")
                
            }
            ans.append(String(s[i]))
            if mask[i], (i == n - 1 || !mask[i + 1]){
                ans.append("</b>")
            }
        }
        return ans.joined()
    }
}
class Q616__Add_Bold_Tag_in_String: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
