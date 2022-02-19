//
//  Q339. Nested List Weight Sum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/17/22.
//

/*
 339. Nested List Weight Sum
 You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists.

 The depth of an integer is the number of lists that it is inside of. For example, the nested list [1,[2,2],[[3],2],1] has each integer's value set to its depth.

 Return the sum of each integer in nestedList multiplied by its depth.

  

 Example 1:


 Input: nestedList = [[1,1],2,[1,1]]
 Output: 10
 Explanation: Four 1's at depth 2, one 2 at depth 1. 1*2 + 1*2 + 2*1 + 1*2 + 1*2 = 10.
 Example 2:


 Input: nestedList = [1,[4,[6]]]
 Output: 27
 Explanation: One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3. 1*1 + 4*2 + 6*3 = 27.
 Example 3:

 Input: nestedList = [0]
 Output: 0
  

 Constraints:

 1 <= nestedList.length <= 50
 The values of the integers in the nested list is in the range [-100, 100].
 The maximum depth of any integer is less than or equal to 50.
 */
//import XCTest
//
//class NestedInteger {
//    // Return true if this NestedInteger holds a single integer, rather than a nested list.
//    public func isInteger() -> Bool
//
//    // Return the single integer that this NestedInteger holds, if it holds a single integer
//    // The result is undefined if this NestedInteger holds a nested list
//    public func getInteger() -> Int
//
//    // Set this NestedInteger to hold a single integer.
//    public func setInteger(value: Int)
//
//    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
//    public func add(elem: NestedInteger)
//
//    // Return the nested list that this NestedInteger holds, if it holds a nested list
//    // The result is undefined if this NestedInteger holds a single integer
//    public func getList() -> [NestedInteger]
//}
//
//private class Solution {
//    func depthSum(_ nestedList: [NestedInteger]) -> Int {
//        return dfs(nestedList, 1)
//    }
//
//    func dfs(_ list: [NestedInteger], _ depth: Int) -> Int {
//        if list.count == 0 {
//            return 0
//        }
//        var total = 0
//        for item in list {
//            if item.isInteger() { //if item is integer
//                total += item.getInteger() * depth
//            } else { //if item is a nested list
//                total += dfs(item.getList(), depth + 1)
//
//            }
//        }
//        return total
//    }
//}
//class Q339__Nested_List_Weight_Sum: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
