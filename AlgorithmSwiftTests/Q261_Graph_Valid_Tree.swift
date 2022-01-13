//
//  Q261_Graph_Valid_Tree.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 1/11/22.
//
/*
 
 You have a graph of n nodes labeled from 0 to n - 1. You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that there is an undirected edge between nodes ai and bi in the graph.

 Return true if the edges of the given graph make up a valid tree, and false otherwise.

  

 Example 1:


 Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
 Output: true
 Example 2:


 Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
 Output: false
  
 */
import XCTest
private class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        //build adjacencyList
        var adjacencyList : [Int:[Int]] = [Int:[Int]]()
        for edge in edges {
            var node = edge[0]
            var subnode = edge[1]
            if adjacencyList[node] == nil { //if not exist in map
                adjacencyList[node] = [Int]()
            }
            adjacencyList[node]!.append(subnode)
            
            if adjacencyList[subnode] == nil { //if not exist in map
                adjacencyList[subnode] = [Int]()
            }
            adjacencyList[subnode]!.append(node)
        }
        
        //check all the nodes
        //use a map to keep track of how we get into each node
        var parent: [Int:Int] = [Int:Int]()
        parent[0] = -1
        var stack: [Int] = [0]
        while !stack.isEmpty {
            var currentNode = stack.removeFirst()
            //check for unseen neighbors
            if let neighbors = adjacencyList[currentNode]{
                for neighbor in neighbors {
                    //don't look at the trivial cycle
                    if parent[currentNode] == neighbor {
                        continue
                    }
                    //check if we already seen this node
                    if parent.keys.contains(neighbor) {
                        return false
                    }
                    
                    //otherwise, put this neightbor onto stack
                    //and record that it has been seen
                    stack.append(neighbor)
                    parent[neighbor] = currentNode
                }
            }
            
        }
        return parent.count == n
    }
}
class Q261_Graph_Valid_Tree: XCTestCase {

    

    func testExample() throws {
        let s = Solution()
//        let n = 5
//        let edges = [[0,1],[0,2],[0,3],[1,4]]
        let n = 2
        let edges = [[1,0]]
        var result = s.validTree(n, edges)
        print("RESULT is: ", result)
        
        //2, [[1,0]] //true
    }

  

}
