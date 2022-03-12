//
//  Q282. Expression Add Operators.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/11/22.
//
/*
 282. Expression Add Operators
 Given a string num that contains only digits and an integer target, return all possibilities to insert the binary operators '+', '-', and/or '*' between the digits of num so that the resultant expression evaluates to the target value.

 Note that operands in the returned expressions should not contain leading zeros.

  

 Example 1:

 Input: num = "123", target = 6
 Output: ["1*2*3","1+2+3"]
 Explanation: Both "1*2*3" and "1+2+3" evaluate to 6.
 Example 2:

 Input: num = "232", target = 8
 Output: ["2*3+2","2+3*2"]
 Explanation: Both "2*3+2" and "2+3*2" evaluate to 8.
 Example 3:

 Input: num = "3456237490", target = 9191
 Output: []
 Explanation: There are no expressions that can be created from "3456237490" to evaluate to 9191.
  

 Constraints:

 1 <= num.length <= 10
 num consists of only digits.
 -231 <= target <= 231 - 1
 
 */
import XCTest
private class Solution {
    
func addOperators(_ num: String, _ target: Int) -> [String] {
    guard num.count != 0 else {return []}
    var res = [String]()
    var array  = Array(num)
    dfs(array, &res, "", target, 0, 0, 0)
    return res
}

func dfs(_ array: [Character], _ res: inout [String], _ path: String, _ target: Int,  _ index: Int, _ value: Int, _ multed: Int) {
    
    //base case
    if index == array.endIndex {
        if value == target {
            res.append(path)
        }
        return
    }
    var curr = 0
    for i in index..<array.endIndex {
        if i != index && array[index] == "0" {break}
        
        //extending the current operand by one digit
        curr = curr * 10 + Int(String(array[i]))!
        if index == 0 {
            dfs(array, &res, path + "\(curr)", target, i + 1, curr, curr) //expand one digit without calculation
        } else {
            dfs(array, &res, path + "+\(curr)", target, i + 1, value + curr, curr) // +
            dfs(array, &res, path + "-\(curr)", target, i + 1, value - curr, -curr) //-
            dfs(array, &res, path + "*\(curr)", target, i + 1, value - multed + multed * curr, multed * curr) //*
        }
    }
    
}
//            if target == total {
//                res.append(path)
//            }
//            return
//        }
//
//        var index = start
//        while index < num.endIndex {
//            let x = Int(String(num[start...index]))!
//
//            if start == num.startIndex {
//                helper(num, num.index(after:index), String(x), target, x, x)
//            }
//            else {
//                helper(num, num.index(after: index), path + "*" + String(x), target, total - last + last * x, last * x)
//                helper(num, num.index(after: index), path + "+" + String(x), target, total + x, x)
//                helper(num, num.index(after: index), path + "-" + String(x), target, total - x, -x)
//            }
//            if x == 0 {
//                break
//            }
//            index = num.index(after:index)
//        }
//    }
}
class Q282__Expression_Add_Operators: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
