//
//  L_All_Permutations_of_Subsets.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/29/21.
//
/*
 
 Given a string with no duplicate characters, return a list with all permutations of the string and all its subsets.



 Examples

 Set = “abc”, all permutations are [“”, “a”, “ab”, “abc”, “ac”, “acb”, “b”, “ba”, “bac”, “bc”, “bca”, “c”, “cb”, “cba”, “ca”, “cab”].

 Set = “”, all permutations are [“”].

 Set = null, all permutations are [].


 */
import XCTest
//private class Solution {
//    func allPermutationsOfSubsets(_ nums: [Int]) -> [[Int]]{
//        var result = [[Int]]()
//        //sanity check
//        if nums.count == 0 {
//            return result
//        }
//        //choose the character to be at the position of "Index"
//          //all the already chosen positions are (0, index - 1)
//          //all the candidate characters can be at position "index"
//          //are in the subarray of (index, array.length-1)
//        var array = nums
//        dfs(&array, 0, &result)
//        return result
//    }
//    func dfs(_ nums: inout [Int], _ index: Int, _ result: inout [[Int]]){
//        result.append(nums[..<index])
//        if index == nums.count - 1 {
//            result.append(nums)
//            return
//        }
//        //all the possible numbers could be placed at index are
//        //the numbers in the subarray (index, nums.length-1)
//        for i in index..<nums.count {
//            swap(&nums, index, i)
//            dfs(&nums, index + 1, &result)
//            //remember to swap back when back track to previou level
//            swap(&nums, index, i)
//
//        }
//    }
//
//    //swap function
//    func swap(_ nums: inout [Int], _ left: Int, _ right: Int) {
//        let tmp = nums[left]
//        nums[left] = nums[right]
//        nums[right] = tmp
//    }
//}

private class Solution {
    func allPermutationsOfSubsets(_ set: String) -> [String] {
        var result =  [String]()
        if set == nil {
            return result
        }
        var path = Array(set)
        dfs(&path, &result, 0)
        return result
    }
    
    private func dfs(_ path: inout [Character], _ result: inout [String], _ index: Int) {
        var partial_path = path[..<index]
        result.append(String(partial_path))
        if path.count > 0 {
            
            for i in index..<path.count {
                print("i is: ", i)
                path.swapAt(index, i)
                dfs(&path, &result, index + 1)
                path.swapAt(index, i)
            }
        }
        
    }
}



class L_All_Permutations_of_Subsets: XCTestCase {

    func testExample() throws {
        let s = Solution()
        let a = "abc"
        let result = s.allPermutationsOfSubsets(a)
        print(result)
    }


}
