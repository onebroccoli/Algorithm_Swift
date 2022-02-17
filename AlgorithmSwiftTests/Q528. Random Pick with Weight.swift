//
//  Q528. Random Pick with Weight.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/15/22.
//
/*
 528. Random Pick with Weight
 You are given a 0-indexed array of positive integers w where w[i] describes the weight of the ith index.

 You need to implement the function pickIndex(), which randomly picks an index in the range [0, w.length - 1] (inclusive) and returns it. The probability of picking an index i is w[i] / sum(w).

 For example, if w = [1, 3], the probability of picking index 0 is 1 / (1 + 3) = 0.25 (i.e., 25%), and the probability of picking index 1 is 3 / (1 + 3) = 0.75 (i.e., 75%).
  

 Example 1:

 Input
 ["Solution","pickIndex"]
 [[[1]],[]]
 Output
 [null,0]

 Explanation
 Solution solution = new Solution([1]);
 solution.pickIndex(); // return 0. The only option is to return 0 since there is only one element in w.
 Example 2:

 Input
 ["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
 [[[1,3]],[],[],[],[],[]]
 Output
 [null,1,1,1,1,0]

 Explanation
 Solution solution = new Solution([1, 3]);
 solution.pickIndex(); // return 1. It is returning the second element (index = 1) that has a probability of 3/4.
 solution.pickIndex(); // return 1
 solution.pickIndex(); // return 1
 solution.pickIndex(); // return 1
 solution.pickIndex(); // return 0. It is returning the first element (index = 0) that has a probability of 1/4.

 Since this is a randomization problem, multiple answers are allowed.
 All of the following outputs can be considered correct:
 [null,1,1,1,1,0]
 [null,1,1,1,1,1]
 [null,1,1,1,0,0]
 [null,1,1,1,0,1]
 [null,1,0,1,0,0]
 ......
 and so on.
  

 Constraints:

 1 <= w.length <= 104
 1 <= w[i] <= 105
 pickIndex will be called at most 104 times.
 */
import XCTest
private class Solution {
    var total: Int
    var pTotal: [Int]
    init(_ w: [Int]){
        total = 0
        pTotal = [Int]()
        for x in w {
            total += x
            pTotal.append(total)
        }
    }
    
    func pickIndex() -> Int {
        let index = Int.random(in: 0..<total)
        var low = 0
        var high = pTotal.count - 1
        while low != high {
            let mid = low + (high - low) / 2
            if pTotal[mid] <= index {
                low = mid + 1
                
            } else {
                high = mid
            }
        }
        return low
        
    }
}
class Q528__Random_Pick_with_Weight: XCTestCase {

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
