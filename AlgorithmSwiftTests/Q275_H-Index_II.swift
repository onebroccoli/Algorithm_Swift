//
//  Q275_H-Index_II.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/1/22.
//
/*
 275. H-Index II
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper and citations is sorted in an ascending order, return compute the researcher's h-index.

 According to the definition of h-index on Wikipedia: A scientist has an index h if h of their n papers have at least h citations each, and the other n − h papers have no more than h citations each.

 If there are several possible values for h, the maximum one is taken as the h-index.

 You must write an algorithm that runs in logarithmic time.

  

 Example 1:

 Input: citations = [0,1,3,5,6]
 Output: 3
 Explanation: [0,1,3,5,6] means the researcher has 5 papers in total and each of them had received 0, 1, 3, 5, 6 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
 Example 2:

 Input: citations = [1,2,100]
 Output: 2
 */
import XCTest
private class Solution {
func hIndex(_ citations: [Int]) -> Int {
    if citations == nil || citations.count == 0 {
        return 0
    }
    if citations.count == 1 && citations[0] == 0 {
        return 0
    }
    if citations.count == 1 && citations[0] > 0 {
        return 1
    }
    //we need to find the rightmost index such that citations[index] < n - index
    
    var left = 0
    var right = citations.count - 1
    var n = citations.count
    while left <= right {
        var mid = left + (right - left) / 2
        if citations[mid] == n - mid {
            return citations[mid]
            
            //if citations[mid] < n - mid, narrow down on the right half to look for a paper
        } else if citations[mid] < n - mid {
            left = mid + 1
        } else {
            // or narrow down on the left half
            right = mid - 1
        }
    }
    
    //didn't find an exact match, so there is exactly n - left papers that have citations >= citations[left]
    return n - left
}
}
class Q275_H_Index_II: XCTestCase {

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
