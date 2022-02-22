//
//  Q973. K Closest Points to Origin.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/18/22.
//
/*
 973. K Closest Points to Origin
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).

 The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)2 + (y1 - y2)2).

 You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).

  

 Example 1:


 Input: points = [[1,3],[-2,2]], k = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:

 Input: points = [[3,3],[5,-1],[-2,4]], k = 2
 Output: [[3,3],[-2,4]]
 Explanation: The answer [[-2,4],[3,3]] would also be accepted.
  

 Constraints:

 1 <= k <= points.length <= 104
 -104 < xi, yi < 104
 */
import XCTest


class MinHeap<Point: Comparable> {
    var heap: [Point]
    init() {
        heap = [Point]()
        
    }
    
    func parent(_ i: Int) -> Int { return (i - 1) / 2}
    func left(_ i: Int) -> Int { return ((2 * i) + 1)}
    func right(_ i: Int) -> Int { return ((2 * i) + 2)}
    
    func heapify(_ i: Int) {
        let n = heap.count
        let left = left(i)
        let right = right(i)
        var smallest = i
        
        //check if left index is within bounds
        //check if left child is smaller than the root
        
        if left < n && heap[left] < heap[i] {
            smallest = left
        }
        //check if right index is within bounds
        //check if right child is smaller than the root
        if right < n && heap[right] < heap[smallest] {
            smallest = right
        }
        
        //swap the child and the parent only
        //if any of the child is smaller
        if smallest != i {
            heap.swapAt(i, smallest)
            heapify(smallest)
        }
    }
    
    //insert at the end of the list
    //and shift up to the root
    func insert(item: Point) {
        heap.append(item)
        var lastIndex = heap.count - 1
        
        while heap[parent(lastIndex)] > item {
            heap.swapAt(lastIndex, parent(lastIndex))
            lastIndex = parent(lastIndex)
        }
    }
    
    //swap the first and last item in the list and shift down
    func extractMin() -> Point? {
        if heap.count == 0 {
            return nil
        }
        let root = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        heapify(0)
        return root
    }
    
    
    func removeItem(at index: Int) {
        if heap.isEmpty {
            return
        }
        heap.swapAt(index, heap.count - 1)
        heap.removeLast()
        heapify(index)
    }
    
    func peek() -> Point? {
        if heap.isEmpty {
            return nil
        }
        return heap[0]
    }
    
    
    func kThLargest(_ k: Int) -> Point? {
        while heap.count > k {
            removeItem(at: 0)
        }
        return peek()
    }
    
}


struct Point {
    let x: Int
    let y: Int
}

extension Point: Comparable {
    static func <(lhs: Point, rhs: Point) -> Bool {
        let x1 = lhs.x * lhs.x
        let y1 = lhs.y * lhs.y
        let x2 = rhs.x * rhs.x
        let y2 = rhs.y * rhs.y
        return (x1 + y1) < (x2 + y2)
    }
}
private class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        //if array points has fewer points than k, then return empty
        if points.count < K {
            return []
        }
        
        let minHeap = MinHeap<Point>()
        
        for point in points {
            minHeap.insert(item: Point(x: point[0], y: point[1]))
        }
        var result = [[Int]]()
        var i = 0
        while i < K {
            let n = minHeap.extractMin()!
            result.append([n.x, n.y])
            i += 1
        }
        return result
    }
    
    
    
    //method2: quick select
    func kClosest_quick(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var points = points
        quickSelect(v: &points, left: 0, right: points.count - 1, k: K)
        return Array(points[0..<K])
    }
    
    
    func partition(arr: inout [[Int]], left: Int, right: Int) -> Int {
        var pivot = arr[right]
        var idx = left
        for i in left..<right {
            if sort(arr[i], pivot) {
                arr.swapAt(i, idx)
                idx += 1
            }
        }
        
        arr.swapAt(idx, right)
        return idx
    }
    
    //calculate the Euclidean distance before the square root, and compare return Bool
    func sort(_ p1: [Int], _ p2: [Int]) -> Bool {
        return p1[0] * p1[0] + p1[1] * p1[1] <= p2[0] * p2[0] + p2[1] * p2[1]
    }
    
    func quickSelect(v: inout [[Int]], left: Int, right: Int, k: Int) {
        var l = left, r = right
        while l <= r {
            var mid = partition(arr: &v, left: l, right: r)
            if mid == k {
                return
            }
            
            if mid < k {
                l = mid + 1
                
            } else{
                r = mid - 1
            }
        }
    }
    
    
}

class Q973__K_Closest_Points_to_Origin: XCTestCase {

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
