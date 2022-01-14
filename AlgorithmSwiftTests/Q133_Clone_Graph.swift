//
//  Q133_Clone_Graph.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/14/22.
//
/*
 Given a reference of a node in a connected undirected graph.

 Return a deep copy (clone) of the graph.

 Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

 class Node {
     public int val;
     public List<Node> neighbors;
 }
  

 Test case format:

 For simplicity, each node's value is the same as the node's index (1-indexed). For example, the first node with val == 1, the second node with val == 2, and so on. The graph is represented in the test case using an adjacency list.

 An adjacency list is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.

 The given node will always be the first node with val = 1. You must return the copy of the given node as a reference to the cloned graph.

  

 Example 1:


 Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
 Output: [[2,4],[1,3],[2,4],[1,3]]
 Explanation: There are 4 nodes in the graph.
 1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
 2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
 3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
 4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
 Example 2:


 Input: adjList = [[]]
 Output: [[]]
 Explanation: Note that the input contains one empty list. The graph consists of only one node with val = 1 and it does not have any neighbors.
 Example 3:

 Input: adjList = []
 Output: []
 Explanation: This an empty graph, it does not have any nodes.
 */


//import XCTest
//private class Solution {
//    var visitedNode: [Int: Node] = [:]
//
//    func cloneGraph(_ node: Node?) -> Node? {
//        guard let val = node?.val else { return nil }
//        //1. if already visited, return and pass
//        if let cloneNode = visitedNode[val] { return cloneNode }
//
//        //2. if not visited, turn val into node, and register in visitedNode
//        let root = Node(val) //copy
//        visitedNode[val] = root
//        // for neighbor in node?.neighbors ?? [] {
//
//        //start copy neighbors using dfs, then append to new root.
//        for neighbor in node!.neighbors{
//
//            if let cloneNeighbor = cloneGraph(neighbor) {
//                root.neighbors.append(cloneGraph(neighbor))
//            }
//        }
//        return root
//    }
//}
class Q133_Clone_Graph: XCTestCase {

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
