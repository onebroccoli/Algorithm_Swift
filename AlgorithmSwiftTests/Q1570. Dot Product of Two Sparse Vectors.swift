//
//  Q1570. Dot Product of Two Sparse Vectors.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/17/22.
//
/*
 Q1570. Dot Product of Two Sparse Vectors
 Given two sparse vectors, compute their dot product.

 Implement class SparseVector:

 SparseVector(nums) Initializes the object with the vector nums
 dotProduct(vec) Compute the dot product between the instance of SparseVector and vec
 A sparse vector is a vector that has mostly zero values, you should store the sparse vector efficiently and compute the dot product between two SparseVector.

 Follow up: What if only one of the vectors is sparse?

  

 Example 1:

 Input: nums1 = [1,0,0,2,3], nums2 = [0,3,0,4,0]
 Output: 8
 Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
 v1.dotProduct(v2) = 1*0 + 0*3 + 0*0 + 2*4 + 3*0 = 8
 Example 2:

 Input: nums1 = [0,1,0,0,0], nums2 = [0,0,0,0,2]
 Output: 0
 Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
 v1.dotProduct(v2) = 0*0 + 1*0 + 0*0 + 0*0 + 0*2 = 0
 Example 3:

 Input: nums1 = [0,1,0,0,2,0,0], nums2 = [1,0,0,0,3,0,4]
 Output: 6
  

 Constraints:

 n == nums1.length == nums2.length
 1 <= n <= 10^5
 0 <= nums1[i], nums2[i] <= 100
 */
//import XCTest
//private class Solution {
//    private var pairs: [[Int]] = []
//    init(_ nums: [Int]) {
//        for i in 0..<nums.count {
//            if nums[i] != 0 {
//                self.pairs.append([i, nums[i]])
//            }
//        }
//    }
//
//
//    //return the dorProduct of two sparse vectors
//    func dotProduct(_ vec: SparseVector) -> Int {
//        var result = 0
//        var p1 = 0 //pointer for keys in pairs
//        var p2 = 0 //pointer for sparsevector
//
//        while p1 < self.pairs.count && p2 < vec.pairs.count {
//            if self.pairs[p1][0] == vec.pairs[p2][0] {
//                result += self.pairs[p1][1] * vec.pairs[p2][1]
//                p1 += 1
//                p2 += 1
//            } else if self.pairs[p1][0] < vec.pairs[p2][0] {
//                p1 += 1
//            } else {
//                p2 += 1
//            }
//        }
//        return result
//    }
//}
//
//
//
//
//class Q1570__Dot_Product_of_Two_Sparse_Vectors: XCTestCase {
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
