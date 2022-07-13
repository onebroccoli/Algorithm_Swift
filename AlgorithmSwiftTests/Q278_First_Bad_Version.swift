//
//  Q278_First_Bad_Version.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 7/26/21.
//

/*
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

  

 Example 1:

 Input: n = 5, bad = 4
 Output: 4
 Explanation:
 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true
 Then 4 is the first bad version.
 Example 2:

 Input: n = 1, bad = 1
 Output: 1

 /**
  * The knows API is defined in the parent class VersionControl.
  *     func isBadVersion(_ version: Int) -> Bool{}
  */
 */
import XCTest

//private class Solution{
//func firstBadVersion(_ n: Int) -> Int {
//    var left = 1
//    var right = n
//    while (left < right){
//        let mid = left + (right - left) / 2
//        if (isBadVersion(mid)){
//            right = mid
//        } else {
//            left = mid + 1
//        }
//    }
//    return left
//}
//}

class Q278_First_Bad_Version: XCTestCase {

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
