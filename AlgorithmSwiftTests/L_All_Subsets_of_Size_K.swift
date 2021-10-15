//
//  L_All_Subsets_of_Size_K.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/29/21.
//
/*
 640. All Subsets of Size K
 Given a set of characters represented by a String, return a list containing all subsets of the characters whose size is K.
 Assumptions
 There are no duplicate characters in the original set.
 ​Examples
 Set = "abc", K = 2, all the subsets are [“ab”, “ac”, “bc”].
 Set = "", K = 0, all the subsets are [""].
 Set = "", K = 1, all the subsets are [].

 */
import XCTest
private class Solution {
func subSetsOfSizeK(_ set: String, _ k: Int)-> [String] {
    var result = [String]()
    if set == nil {
        return result
    }
    var array = Array(set)
    //record the current subset
    var path = [Character]()
    dfs(array, k, &path, 0, &result)
    return result
    
}

private func dfs(_ array: [Character], _ k: Int, _ path: inout [Character], _ index: Int, _ result: inout [String]) {
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
    
    //1. not pick the character at index
    dfs(array, k, &path, index + 1, &result)
    
    //2.pick the character at index
    path.append(array[index])
    dfs(array, k, &path, index + 1, &result)
    path.removeLast()
}
    
    
    
    
//
//
//
//    func subSetsOfSizeK(_ set: String, _ k: Int) -> [String]{
//        let arr = Array(set)
//        print (arr)
//        var result = [String]()
//        let str = ""
//        dfs(arr, k, 0, &result, str)
//        return result
//
//    }
//
//    func dfs(_ arr: [Character], _ k: Int, _ index: Int, _ result: inout [String], _ str: String){
//        if str.count == k {
//            result.append(str)
//            return
//        }
//        if index == arr.count {
//            return
//        }
//        //not pick character
//        let s = str
//        dfs(arr, k, index + 1, &result, s)
//
//        //add the character
//
////        var s = str + String(set[index])
////        let s = str + String(set[set.index(set.startIndex, offsetBy:index)])
//        let s2 = str + String(arr[index])
//
//        dfs(arr, k, index + 1, &result, s2)
//
//    }
}

class L_All_Subsets_of_Size_K: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let result = s.subSetsOfSizeK("abc",2)
        print (result)
    }

}
