//
//  Q225_Implement_Stack_using_Queues.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/6/21.
//
/*
 Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).

 Implement the MyStack class:

 void push(int x) Pushes element x to the top of the stack.
 int pop() Removes the element on the top of the stack and returns it.
 int top() Returns the element on the top of the stack.
 boolean empty() Returns true if the stack is empty, false otherwise.
 Notes:

 You must use only standard operations of a queue, which means that only push to back, peek/pop from front, size and is empty operations are valid.
 Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.
  

 Example 1:

 Input
 ["MyStack", "push", "push", "top", "pop", "empty"]
 [[], [1], [2], [], [], []]
 Output
 [null, null, null, 2, 2, false]

 Explanation
 MyStack myStack = new MyStack();
 myStack.push(1);
 myStack.push(2);
 myStack.top(); // return 2
 myStack.pop(); // return 2
 myStack.empty(); // return False
  

 Constraints:

 1 <= x <= 9
 At most 100 calls will be made to push, pop, top, and empty.
 All the calls to pop and top are valid.
  

 Follow-up: Can you implement the stack using only one queue?
 */
import XCTest

private class Solution {

    init() {
        
    }
    
    var queue = [Int]()
    
    func push(_ x: Int) {
        queue.append(x)
        var size = queue.count
        while size > 1 {
            queue.append(queue.first!)
            queue.removeFirst()
            size -= 1
        }
    }
    
    func pop() -> Int {
        let h = queue.first!
        queue.removeFirst()
        return h
    }
    
    func top() -> Int {
        return queue.first!
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}


//private class Solution {
//    var queue = [Int]()
////    var queue2 = [Int]()
//
//    func push(_ n: Int) {
//        queue.append(n)
//    }
//
//    func pop() -> Int {
//        let n = queue.removeLast()
//        return n
//    }
//
//    func top() -> Int{
//        let n = queue.last
//        return n!
//    }
//
//    func empty() -> Bool {
//        if queue.count == 0 {
//            return true
//        } else {
//            return false
//        }
//    }
//}




class Q225_Implement_Stack_using_Queues: XCTestCase {

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
