//
//  Q155_Min_Stack.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/6/21.
//
/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 Implement the MinStack class:
 MinStack() initializes the stack object.
 void push(val) pushes the element val onto the stack.
 void pop() removes the element on the top of the stack.
 int top() gets the top element of the stack.
 int getMin() retrieves the minimum element in the stack.
  
 Example 1:
 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]

 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2

 Solution:
 stack1(in) [1,3,-2,5]
 stack2(out)[1,1,-2,-2]

 */
import XCTest
private class Solution {
    /** initialize your data structure here. */
    init() {
        
    }
    var stack: [(Int, Int)] = []
    var currentMin: Int = Int.max
    
    func push(_ val: Int) {
        if val < currentMin {
            currentMin = val
        }
        stack.append((val, currentMin))
    }
    //remove the last element in stack, if stack still has at least 1 element, assign the new min to current min , if now, can change to Int.max
    func pop() {
        stack.removeLast()
        if let nextMin = stack.last?.1 {
            currentMin = nextMin
        } else {
            currentMin = Int.max
        }
    }
    
    func top() -> Int {
        return stack.last?.0 ?? Int.max
    }
    
    func getMin() -> Int {
        return currentMin
    }
}
class Q155_Min_Stack: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
