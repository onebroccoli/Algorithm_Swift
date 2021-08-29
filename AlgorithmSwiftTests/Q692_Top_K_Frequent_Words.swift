//
//  Q692_Top_K_Frequent_Words.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/9/21.
//
/*
 Given an array of strings words and an integer k, return the k most frequent strings.

 Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.

  

 Example 1:

 Input: words = ["i","love","leetcode","i","love","coding"], k = 2
 Output: ["i","love"]
 Explanation: "i" and "love" are the two most frequent words.
 Note that "i" comes before "love" due to a lower alphabetical order.
 Example 2:

 Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
 Output: ["the","is","sunny","day"]
 Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.
  

 Constraints:

 1 <= words.length <= 500
 1 <= words[i] <= 10
 words[i] consists of lowercase English letters.
 k is in the range [1, The number of unique words[i]]
  

 Follow-up: Could you solve it in O(n log(k)) time and O(n) extra space?


 
 */
import XCTest

private class Solution {
func topKFrequent(_ words: [String], _ k: Int) -> [String]{
    //create a map for words
    var map: [String : Int] = [:]
    
    //iterate through the list
    //也可以用
    //words.forEach(map[$0, default: 0] += 1)
    for word in words {
        map[word, default: 0] += 1
    }
    /*
     sort by frequency or alternatively alphabetically as requested in the challenge
     */
    let sorted: [(key: String, value: Int)] = map.sorted {element1, element2 in
        if element1.value == element2.value {
            return element1.key < element2.key
        }
        return element1.value > element2.value
    }
    
    //get only k elements:
    
    
    let mapFiltered: [(key: String, value: Int)] = Array(sorted[0..<k])
    
    let keys = mapFiltered.map{$0.key}
    return keys
        
//        return mapFiltered.map {element in
//            return element.key
//        }
    }
}


class Q692_Top_K_Frequent_Words: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.topKFrequent(["i","love","love","s","i"], 2)
        print ("result is" , result)
    }

}
