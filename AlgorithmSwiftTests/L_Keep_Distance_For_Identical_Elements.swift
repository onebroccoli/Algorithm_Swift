//
//  L_Keep_Distance_For_Identical_Elements.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/15/21.
//
/*
 Lai 264. Keep Distance For Identical Elements(C++ not ready)

 Given an integer k, arrange the sequence of integers [1, 1, 2, 2, 3, 3, ...., k - 1, k - 1, k, k], such that the output integer array satisfy this condition:

 Between each two i's, they are exactly i integers (for example: between the two 1s, there is one number, between the two 2's there are two numbers).

 If there does not exist such sequence, return null.

 Assumptions:

 k is guaranteed to be > 0
 Examples:

 k = 3, The output = { 2, 3, 1, 2, 1, 3 }.
 */
import XCTest

private class Solution {
func keepDistance(_ k: Int) -> [Int] {
    //Assumption: k > 0
    var array = Array(repeating: 0, count: 2*k)
    //generate array of k pairs, if k = 2, then {1,1,2,2}
    for i in 0..<k {
        array[i * 2] = i + 1
        array[i * 2 + 1] = i + 1
    }
    print("array:", array)
    
    //used[i] == true if and only if i is used once
    var used = Array(repeating: false, count: k + 1)
    print("used: ", used)
    return dfs(&array, 0, &used) ? array : []
}

private func dfs(_ array: inout [Int], _ index: Int, _ used: inout [Bool])-> Bool {
    if index == array.count {
        return true
    }
    for i in index..<array.count {
        let cur = array[i]
        if (!used[cur] || (index > cur && array[index - cur - 1] == cur)) {
            array.swapAt(index, i)
            used[cur] = !used[cur]
            if dfs(&array, index + 1, &used) {
                return true
            }
            array.swapAt(index, i)
            used[cur] = !used[cur]
        }
    }
    return false
}

}


class L_Keep_Distance_For_Identical_Elements: XCTestCase {

    
    func testExample() throws {
        let s = Solution()
        let result = s.keepDistance(3)

        print("=====RESULT: ==== ", result)
    }

   
}
