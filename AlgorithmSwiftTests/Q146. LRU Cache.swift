//
//  Q146. LRU Cache.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/9/22.
//
/*
 146. LRU Cache

 */
//import XCTest
////doubly linnkedlist node class
//class Node{
//    var pre: Node?
//    var next: Node?
//    var key: Int
//    var value: Int
//    init(_ key: Int, _ value: Int){
//        self.key = key
//        self.value = value
//    }
//}
//
//class LRUCache {
//    var capacity: Int
//    var head: Node?
//    var tail: Node?
//    var count: Int
//    var map: [Int : Node]
//    init(_ capacity: Int) {
//        self.capacity = capacity
//        head = Node(-1, -1)
//        tail = Node(-1, -1)
//        head?.next = tail
//        tail?.pre = head
//        count = 0
//        map = [Int: Node]()
//    }
//
//    //move certain node in between to the head
//    func moveToHead(_ node: Node?){
//        node?.next = head?.next
//        head?.next?.pre = node
//        node?.pre = head
//        head?.next = node
//    }
//
//
//    func deleteNode(_ node: Node?){
//        node?.next?.pre = node?.pre
//        node?.pre?.next = node?.next
//    }
//
//    func get(_ key: Int) -> Int {
//        if(map[key] == nil){
//            return -1
//        }
//        var node = map[key]
//        deleteNode(node)
//        moveToHead(node)
//        return node!.value
//    }
//
//    func put(_ key: Int, _ value: Int) {
//
//        if(map[key] != nil){
//            var node = map[key]
//            node?.value = value
//            deleteNode(node)
//            moveToHead(node)
//            return
//        }
//
//        var node = Node(key, value)
//        map[key] = node
//        if(count == capacity){
//            var delete = tail?.pre
//            deleteNode(delete)
//            map[delete!.key] = nil
//            count -= 1
//        }
//        moveToHead(node)
//        count+=1
//      
//    }
//}


/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
//class Q146__LRU_Cache: XCTestCase {
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

//}
