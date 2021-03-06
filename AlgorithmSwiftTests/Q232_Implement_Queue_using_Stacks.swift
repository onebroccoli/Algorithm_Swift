//
//  Q232_Implement_Queue_using_Stacks.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/6/21.
//
/*
 Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).

 Implement the MyQueue class:

 void push(int x) Pushes element x to the back of the queue.
 int pop() Removes the element from the front of the queue and returns it.
 int peek() Returns the element at the front of the queue.
 boolean empty() Returns true if the queue is empty, false otherwise.
 Notes:

 You must use only standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
 Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
 Follow-up: Can you implement the queue such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.

  

 Example 1:

 Input
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]
 Output
 [null, null, null, 1, 1, false]

 Explanation
 MyQueue myQueue = new MyQueue();
 myQueue.push(1); // queue is: [1]
 myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
 myQueue.peek(); // return 1
 myQueue.pop(); // return 1, queue is [2]
 myQueue.empty(); // return false
  

 Constraints:

 1 <= x <= 9
 At most 100 calls will be made to push, pop, peek, and empty.
 All the calls to pop and peek are valid.

 */
import XCTest
private class Solution {
    init() {
        
    }
    
    var stack = [Int]()
    var tempStack =  [Int]()
    
    //push element x to the back of queue
    func push(_ x: Int) {
        stack.append(x)
    }
    
    //move all the elements from stack1 to stack2 until the last one
    //record the last element
    //move all the elements from stack2 back to stack1
    //return the recorded last element
    func pop() -> Int {
        while stack.count != 1 {
            tempStack.append(stack.removeLast())
        }
        let h = stack.removeLast()
        while tempStack.count != 0 {
            stack.append(tempStack.removeLast())
        }
        return h
    }
    
    
    //same as pop except, not remove instead just call .last
    func peek() -> Int {
        while stack.count != 1 {
            tempStack.append(stack.removeLast())
        }
        let h = stack.last!
        while tempStack.count != 0 {
            stack.append(tempStack.removeLast())
        }
        return h
    }
    
    func empty() -> Bool {
        if stack.count == 0 {
            return true
        } else {
            return false
        }
    }
    //????????????array???????????? stack[0], ??????remove(at:0) ???????????????
//    /** Removes the element from in front of queue and returns that element. */
//       func pop() -> Int {
//
//           let ele = self.stack[0]
//
//           self.stack.remove(at:0)
//           return ele
//
//       }
//
//       /** Get the front element. */
//       func peek() -> Int {
//
//           return self.stack[0]
//
//       }
    
    

    static func getSolution() -> Void {
        let queue = Solution()
        queue.push(1); queue.push(2); queue.push(3); queue.push(4);
        print(queue.pop()); print(queue.pop()); print(queue.pop()); print(queue.pop());
        print(queue.empty())
        
    }
}



class Q232_Implement_Queue_using_Stacks: XCTestCase {

    func testExample() throws {
        let queue = Solution()
        queue.push(1); queue.push(2); queue.push(3); queue.push(4);
        print(queue.pop()); print(queue.pop()); print(queue.pop()); print(queue.pop());
        print(queue.empty())
    }


}
