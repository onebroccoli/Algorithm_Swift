//
//  Q1868. Product of Two Run-Length Encoded Arrays.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 4/7/22.
//
/*
 1868. Product of Two Run-Length Encoded Arrays
 Run-length encoding is a compression algorithm that allows for an integer array nums with many segments of consecutive repeated numbers to be represented by a (generally smaller) 2D array encoded. Each encoded[i] = [vali, freqi] describes the ith segment of repeated numbers in nums where vali is the value that is repeated freqi times.

 For example, nums = [1,1,1,2,2,2,2,2] is represented by the run-length encoded array encoded = [[1,3],[2,5]]. Another way to read this is "three 1's followed by five 2's".
 The product of two run-length encoded arrays encoded1 and encoded2 can be calculated using the following steps:

 Expand both encoded1 and encoded2 into the full arrays nums1 and nums2 respectively.
 Create a new array prodNums of length nums1.length and set prodNums[i] = nums1[i] * nums2[i].
 Compress prodNums into a run-length encoded array and return it.
 You are given two run-length encoded arrays encoded1 and encoded2 representing full arrays nums1 and nums2 respectively. Both nums1 and nums2 have the same length. Each encoded1[i] = [vali, freqi] describes the ith segment of nums1, and each encoded2[j] = [valj, freqj] describes the jth segment of nums2.

 Return the product of encoded1 and encoded2.

 Note: Compression should be done such that the run-length encoded array has the minimum possible length.

  

 Example 1:

 Input: encoded1 = [[1,3],[2,3]], encoded2 = [[6,3],[3,3]]
 Output: [[6,6]]
 Explanation: encoded1 expands to [1,1,1,2,2,2] and encoded2 expands to [6,6,6,3,3,3].
 prodNums = [6,6,6,6,6,6], which is compressed into the run-length encoded array [[6,6]].
 Example 2:

 Input: encoded1 = [[1,3],[2,1],[3,2]], encoded2 = [[2,3],[3,3]]
 Output: [[2,3],[6,1],[9,2]]
 Explanation: encoded1 expands to [1,1,1,2,3,3] and encoded2 expands to [2,2,2,3,3,3].
 prodNums = [2,2,2,6,9,9], which is compressed into the run-length encoded array [[2,3],[6,1],[9,2]].
  

 Constraints:

 1 <= encoded1.length, encoded2.length <= 105
 encoded1[i].length == 2
 encoded2[j].length == 2
 1 <= vali, freqi <= 104 for each encoded1[i].
 1 <= valj, freqj <= 104 for each encoded2[j].
 The full arrays that encoded1 and encoded2 represent are the same length.
 */
import XCTest
private class Solution {
func findRLEArray(_ encoded1: [[Int]], _ encoded2: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var i = 0
    var j = 0
    
    var offSet1 = 0
    var offSet2 = 0
    
    //[1,3],[2,1],[3,2]
    //[2,3],[3,3]
    
    while i < encoded1.count && j < encoded2.count {
        let product = encoded1[i][0] * encoded2[j][0]
        let len = min(encoded1[i][1] - offSet1, encoded2[j][1] - offSet2)
        if result.isEmpty || result.last!.first! != product {
            result.append([product, len])
        } else {
            result[result.count - 1][1] += len
        }
        
        if encoded2[j][1] - offSet2 > encoded1[i][1] - offSet1 {
            offSet2 += encoded1[i][1] - offSet1
            offSet1 = 0
            i += 1
        } else if encoded2[j][1] - offSet2 < encoded1[i][1] - offSet1 {
            offSet1 += encoded2[j][1] - offSet2
            offSet2 = 0
            j += 1
        } else {
            i += 1
            j += 1
            offSet1 = 0
            offSet2 = 0
        }
        
        
    }
    return result
    
}
}
class Q1868__Product_of_Two_Run_Length_Encoded_Arrays: XCTestCase {

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
