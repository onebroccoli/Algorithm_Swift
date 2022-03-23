//
//  Q1249_Minimum_Remove_to_Make_Valid_Parentheses.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/22/21.
//

import XCTest
private class Solution{
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var invalidPos = [Int]()
        for (i, char) in s.enumerated(){
            if char == "(" {
                stack.append(i)
                continue
            }
            if char == ")"{
                if stack.count == 0 {
                    invalidPos.append(i)
                } else {
                    stack.removeLast()
                }
            }
        }
        invalidPos += stack //combine two arrays, stack has all invalid "("
        invalidPos = Array(invalidPos.sorted().reversed()) //we need to remove the positions in invalidPos later, so has to be sorted and reversed to the same order as string
        var arr = Array(s)
        
        for i in invalidPos {
            arr.remove(at: i)
        }
        return String(arr)
    }
    
func minRemoveToMakeValid_noStack(_ s: String) -> String {
   var balance = 0
   var invalidList = [Int]()
   for (i, char) in s.enumerated() {
       if char == "(" {
           
           balance += 1
           invalidList.append(i)
       } else if char == ")" {
           balance -= 1
           if balance < 0 {
               invalidList.append(i)
               balance = 0
           } else {
               invalidList.removeLast()
           }
       }
   }
   var res = Array(s)
    invalidList = Array(invalidList.sorted().reversed())
   for i in invalidList {
       res.remove(at:i)
   }
   return String(res)
}

    
func minRemoveToMakeValid_O1Space(_ s: String) -> String {
    var open = 0
    var result = Array(s)
    for (i, char) in s.enumerated() {
        if char  == "(" {
            open += 1
        } else if char == ")" {
            if open == 0 { //invalid ")"
                result[i] = "*" //mark as invalid
                
            } else {
                open -= 1
            }
        }
        
    }
    result = result.reversed()
    for (i,char) in result.enumerated() {
        if open > 0 && result[i] == "(" {
            result[i] = "*" //scan from back to front, if see invalid (, mark * as invalid
            open -= 1
        }
    }
    
    result = result.reversed()
    
    var p = 0
    for i in 0..<result.count {
        if result[i] != "*" {
            result[p] = result[i]
            p += 1
        }
    }
    
    return String(result[0..<p])
    
}
}

class Q1249_Minimum_Remove_to_Make_Valid_Parentheses: XCTestCase {

    func testExample() throws {
        let s = Solution()
//        let a : String =  "lee(t(c)o)de)"
        let a : String = "())()((("
        let res = s.minRemoveToMakeValid_O1Space(a)
        print("result: === ", res)
        
    }

}
