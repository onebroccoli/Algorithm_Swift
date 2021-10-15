//
//  L_All_Subsets_II_of_Size_K_duplication.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/15/21.
//

/*
 Lai
 641. All Subsets II of Size K

 Given a set of characters represented by a String, return a list containing all subsets of the characters whose size is K. Notice that each subset returned will be sorted for deduplication.



 Assumptions

 There could be duplicate characters in the original set.

 ​

 Examples

 Set = "abc", K = 2, all the subsets are [“ab”, “ac”, “bc”].

 Set = "abb", K = 2, all the subsets are [“ab”, “bb”].

 Set = "abab", K = 2, all the subsets are [“aa”, “ab”, “bb”].

 Set = "", K = 0, all the subsets are [""].

 Set = "", K = 1, all the subsets are [].

 Set = null, K = 0, all the subsets are [].
 */


import XCTest

private class Solution {
func subSetsOfSizeK(_ set: String, _ k: Int)-> [String] {
    var result = [String]()
    if set == nil {
        return result
    }
    var array = Array(set)
    array = array.sorted(by: <)
    //record the current subset
    var path = [Character]()
    dfs(array, k, &path, 0, &result)
    return result
    
}

private func dfs(_ array: [Character], _ k: Int, _ path: inout [Character], _ index: Int, _ result: inout [String]) {
    var index = index
    //temrination condition
    //when reached k elements, add the subset to result and return
    if path.count == k {
        result.append(String(path))
        return
    }
    
    //when we finishes determining for all the characters pick or not, we must return
    if index == array.count {
        return
    }
    
    
    //1.pick the character at index
    path.append(array[index])
    dfs(array, k, &path, index + 1, &result)
    path.removeLast()
    
    while index < array.count - 1 && array[index] == array[index + 1] {
        index += 1
    }
    
    //2. not pick the character at index
    dfs(array, k, &path, index + 1, &result)
    
}
    
}



class L_All_Subsets_II_of_Size_K_duplication: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let a = "abacc"
        let k = 3
        let result = s.subSetsOfSizeK(a, k)
        print("======RESULT:====== ", result)
    
    }

}
