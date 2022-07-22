//
//  Q212. Word Search II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/20/22.
//
/*
 212. Word Search II

 Given an m x n board of characters and a list of strings words, return all words on the board.

 Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

  

 Example 1:


 Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
 Output: ["eat","oath"]
 Example 2:


 Input: board = [["a","b"],["c","d"]], words = ["abcb"]
 Output: []
  

 Constraints:

 m == board.length
 n == board[i].length
 1 <= m, n <= 12
 board[i][j] is a lowercase English letter.
 1 <= words.length <= 3 * 104
 1 <= words[i].length <= 10
 words[i] consists of lowercase English letters.
 All the strings of words are unique.
 
 
 You would need to optimize your backtracking to pass the larger test. Could you stop backtracking earlier?
 */
import XCTest
private class Solution {
    func findWords(_ board: [[Character]], _ words: [String] ) -> [String] {
        var board = board
        let m = board.count
        let n = board[0].count
        let root = Trie()
        buildTrie(words, root)
        var res = [String]()
        for i in 0..<m {
            for j in 0..<n {
                dfs(&board, i , j, &res, root)
            }
        }
        return res
        
    }
    
    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ res: inout [String], _ root: Trie) {
        let m = board.count
        let n = board[0].count
        guard i < m , i >= 0, j < n , j >= 0 else {return}
        if board[i][j] == "#" {
            return
        }
        let char = board[i][j]
        guard let child = root.child[char] else {
            return
        }
        if let key = root.child[char]?.key {
            res.append(key)
            root.child[char]?.key = nil
        }
        board[i][j] = "#"
        dfs(&board, i + 1, j, &res, child)
        dfs(&board, i - 1, j, &res, child)
        dfs(&board, i, j + 1, &res, child)
        dfs(&board, i, j - 1, &res, child)
        board[i][j] = char
    }
    
    func buildTrie(_ words: [String], _ root: Trie) {
        for word in words {
            var root = root
            for char in word {
                if root.child[char] == nil {
                    root.child[char] = Trie()
                }
                root = root.child[char]!
            }
            root.key = word
        }
    }
}

class Trie {
    var child: [Character: Trie]
    var key: String?
    init() {
        child = [Character: Trie]()
    }
}
class Q212__Word_Search_II: XCTestCase {

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
