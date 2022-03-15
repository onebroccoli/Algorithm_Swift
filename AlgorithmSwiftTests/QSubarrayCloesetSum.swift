//
//  QSubarrayCloesetSum.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/7/22.
//
/*
 Lincode 139 · 最接近零的子数组和
 给定一个整数数组，找到一个和最接近于零的子数组。返回满足要求的子数组的起始位置和结束位置。
 保证任意数的和都在
 [-2^{31},2^{31}-1]范围内
 样例1
 输入:
 [-3,1,1,-3,5]
 输出:
 [0,2]
 解释: [0,2], [1,3], [1,1], [2,2], [0,4]

 挑战O(nlogn)TC

 */
//import XCTest
//private class Solution {
//    
//    func subarraySumClosest(_ nums: [Int]) -> [Int] {
//        if nums.count == 1 {
//            return [0, 0]
//        }
//        
//        
//    }
//}
//class QSubarrayCloesetSum: XCTestCase {
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
