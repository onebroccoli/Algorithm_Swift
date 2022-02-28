//
//  F_number_of_1s.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 FB counting number of 1s in an Integer
 */
import XCTest
private class Solution {
    func countOnes(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        var n = n
        var count = 0
        while n != 0 {
            if n % 10 == 1 {
                count += 1
                
            }
            n = n / 10
        }
        return count
    }
}
class F_number_of_1s: XCTestCase {

    
    func testExample() throws {
        let s = Solution()
        let a = 1111 //1001
        let result = s.countOnes(a)
        print("result ===: ", result)
    }

   

}
