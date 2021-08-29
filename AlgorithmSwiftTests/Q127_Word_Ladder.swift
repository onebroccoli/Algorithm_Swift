//
//  Q127_Word_Ladder.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/16/21.
//
/*
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

  

 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
  

 Constraints:

 1 <= beginWord.length <= 10
 endWord.length == beginWord.length
 1 <= wordList.length <= 5000
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.
 */

        
import XCTest
private class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {

        if !wordList.contains(endWord) {
            return 0
        }
        let dict = Set(wordList)
        var beginSet = Set<String>()
        var endSet = Set<String>()
        var visitedSet = Set<String>()
        var length = 1
        var found = false
        
        beginSet.insert(beginWord)
        endSet.insert(endWord)
        
        while !found && !beginSet.isEmpty && !endSet.isEmpty {
            var nextSet = Set<String>()
            //accelerating search speed by swap begin and end
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            found = helper(beginSet, endSet, dict, &visitedSet, &nextSet)
            beginSet = nextSet
            length += 1
        }
        return found ? length : 0
    }
    private func helper(_ beginSet: Set<String>, _ endSet: Set<String>, _ dict: Set<String>, _ visitedSet: inout Set<String>, _ resSet: inout Set<String>) -> Bool {
        let alphaArray = Array("abcdefghijklmnopqrstuvwxyz")
        for word in beginSet {
            for i in 0..<word.count {
                var chars = Array(word)
                for j in 0..<alphaArray.count {
                    chars[i] = alphaArray[j]
                    let str = String(chars)
                    if dict.contains(str) {
                        if endSet.contains(str){
                            return true
                        }
                        if !visitedSet.contains(str) {
                            resSet.insert(str)
                            visitedSet.insert(str)
                        }
                    }
                }
            }
        }
        return false
    }
    
}
class Q127_Word_Ladder: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let res = s.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
        print ("takes " , res, " steps. ")
    }

  
}
