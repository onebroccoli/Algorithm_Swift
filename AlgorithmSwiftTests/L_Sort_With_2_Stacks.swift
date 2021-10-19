//
//  L_Sort_With_2_Stacks.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/18/21.
//
/*
 lai: 280. Sort With 2 Stacks
 Given an array that is initially stored in one stack, sort it with one additional stacks (total 2 stacks).

 After sorting the original stack should contain the sorted integers and from top to bottom the integers are sorted in ascending order.

 Assumptions:

 The given stack is not null.
 There can be duplicated numbers in the give stack.
 Requirements:

 No additional memory, time complexity = O(n ^ 2).
 
 */
import XCTest

private class Solution {
    func sort(_ s1: inout [Int]) {
        
        if s1 == nil || s1.count <= 1 {return}
        var s2 = [Int]()
        sort(&s1, s2)
    }
    
    private func sort(_ s1: inout [Int], _ s2: [Int]) {
        //input: unsorted elements
        //s2: top part buffer
        //step1: sort in ascending order and store result in buffer s2
   
        var s2 = s2
        while !s1.isEmpty {
            var globalMin = Int.max ////stores the maximum possible value for any integer variable
            var count = 0 //store the ccurent frequency of globalMin if there are duplicates.
            while !s1.isEmpty {
                var cur = s1.removeLast()
                if cur < globalMin {
                    globalMin = cur
                    count = 1
                } else if cur == globalMin {
                    count += 1
                }
                s2.append(cur)
            }
            while !s2.isEmpty && s2.last! >= globalMin {
                var tmp = s2.removeLast()
                if tmp != globalMin {
                    s1.append(tmp)
                }
            }
            //movel global
            while count > 0 {
                s2.append(globalMin)
                count -= 1
            }
        }
        //step2: move result from buffer to input, so it's in descending order
        while !s2.isEmpty {
            s1.append(s2.removeLast())
        }
        print("abc")
        print(s1)
    }
}

class L_Sort_With_2_Stacks: XCTestCase {

    
    func testExample() throws {
        let s = Solution()
        var s1 = [1,3,5,2,4]
        s.sort(&s1)
        print("RESULT=======")
        print(s1)
    }


}
