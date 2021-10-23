//
//  Q641_Design_Circular_Deque.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 10/19/21.
//

//import XCTest
//
//private class Solution {
//    init(_ k: Int) {
//
//    }
//
//    var left: [Int] = []
//    var right: [Int] = []
//    var buffer: [Int] = []
//    func insertFront(_ value: Int) -> Bool {
//        if isFull() {
//            return false
//        } else {
//            left.append(value)
//            return true
//        }
//    }
//
//    func insertLast(_ value: Int) -> Bool {
//        if isFull() {
//            return false
//        } else {
//            right.append(value)
//            return true
//        }
//    }
//
//    func deleteFront() -> Bool {
//        if isEmpty() {
//            return false
//        } else {
//
//            left.removeLast()
//            return true
//        }
//    }
//
//    func deleteLast() -> Bool {
//
//    }
//
//    func getFront() -> Int {
//
//    }
//
//    func getRear() -> Int {
//
//    }
//
//    func isEmpty() -> Bool {
//        return left.isEmpty && right.isEmpty
//    }
//
//    func isFull() -> Bool {
//        return left.count + right.count == size
//    }
//
//
//
//}


//class Q641_Design_Circular_Deque: XCTestCase {
//
//
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//
//}
