//
//  Q1492. The kth Factor of n.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/5/22.
//
/*
 1492. The kth Factor of n
 You are given two positive integers n and k. A factor of an integer n is defined as an integer i where n % i == 0.

 Consider a list of all factors of n sorted in ascending order, return the kth factor in this list or return -1 if n has less than k factors.

  

 Example 1:

 Input: n = 12, k = 3
 Output: 3
 Explanation: Factors list is [1, 2, 3, 4, 6, 12], the 3rd factor is 3.
 Example 2:

 Input: n = 7, k = 2
 Output: 7
 Explanation: Factors list is [1, 7], the 2nd factor is 7.
 Example 3:

 Input: n = 4, k = 4
 Output: -1
 Explanation: Factors list is [1, 2, 4], there is only 3 factors. We should return -1.
  

 Constraints:

 1 <= k <= n <= 1000
  

 Follow up:

 Could you solve this problem in less than O(n) complexity?
 */
import XCTest
private class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {

        var mid = Int(sqrt(Double(n)))
        var stackFirst: [Int] = []
        var stackSecond: [Int] = []

        for i in 1...mid {
            if n % i == 0 {
                if n / i != i {
                    stackFirst.append(i)
                    stackSecond.insert(n/i,at: 0)
                }else {
                    stackFirst.append(i)
                }
            }
            
        }
        //check:
        if stackFirst.count + stackSecond.count < k {
            return -1
        } else {
            if stackFirst.count > k - 1 {
                return stackFirst[k - 1]
            } else {
                return stackSecond[k - stackFirst.count - 1]
            }
        }
    }
}
class Q1492__The_kth_Factor_of_n: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
        let n = 12
        let k = 3
//        let result = s.kthFactor(n, k)
        let result = s.kthFactor(4, 4) //[1,2,4] -1
        print("result === ", result)
    }

}
