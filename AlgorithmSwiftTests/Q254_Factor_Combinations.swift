//
//  Q254_Factor_Combinations.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/29/21.
//
/*
 Numbers can be regarded as the product of their factors.

 For example, 8 = 2 x 2 x 2 = 2 x 4.
 Given an integer n, return all possible combinations of its factors. You may return the answer in any order.

 Note that the factors should be in the range [2, n - 1].

  

 Example 1:

 Input: n = 1
 Output: []
 Example 2:

 Input: n = 12
 Output: [[2,6],[3,4],[2,2,3]]
 Example 3:

 Input: n = 37
 Output: []
 Example 4:

 Input: n = 32
 Output: [[2,16],[4,8],[2,2,8],[2,4,4],[2,2,2,4],[2,2,2,2,2]]
 
 */
import XCTest

//private class Solution {
//    func combinations(_ target: Int) -> [[Int]] {
//        var result = [[Int]]()
//        var cur = [Int]()
//        dfs(target, 2, &cur, &result)
//        return result
//    }
//    func dfs(_ target: Int, _ start: Int, _ cur: inout [Int], _ result: inout [[Int]]){
//        let num = Int(sqrt(Double(target)))
//        var i :Int = start
//        while(i <= num) {
//            if target % i == 0 {
//                    cur.append(i)
//                    cur.append(target / i)
//                    result.append(cur)
//                    cur.removeLast()
//                    dfs(target / i, i, &cur, &result)
//                    cur.removeLast()
//            }
//            i += 1
//        }
//    }
//}

private class Solution{
    func getFactors(_ n:Int) -> [[Int]]{
        var res:[[Int]] = [[Int]]()
        var arr:[Int] = [Int]()
        helper(n,2,&arr,&res)
        return res
    }
    
    func helper(_ n:Int,_ start:Int,_ out:inout [Int],_ res:inout [[Int]])
    {
        var num:Int = Int(floor(sqrt(Double(n))))
        var i :Int = start
        while(i <= num)
        {
            if n % i == 0
            {
                var new_out:[Int] = out
                new_out.append(i)
                helper(n / i, i, &new_out, &res)
                new_out.append(n / i)
                res.append(new_out)
            }
            i += 1
        }
    }
}



class Q254_Factor_Combinations: XCTestCase {


    func testExample() throws {
        let s = Solution()
        let result = s.getFactors(20)
        print (result)
    }


}
