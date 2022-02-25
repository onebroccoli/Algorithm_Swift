//
//  Q1507. Reformat Date.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/23/22.
//
/*
 1507. Reformat Date
 Given a date string in the form Day Month Year, where:

 Day is in the set {"1st", "2nd", "3rd", "4th", ..., "30th", "31st"}.
 Month is in the set {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}.
 Year is in the range [1900, 2100].
 Convert the date string to the format YYYY-MM-DD, where:

 YYYY denotes the 4 digit year.
 MM denotes the 2 digit month.
 DD denotes the 2 digit day.
  

 Example 1:

 Input: date = "20th Oct 2052"
 Output: "2052-10-20"
 Example 2:

 Input: date = "6th Jun 1933"
 Output: "1933-06-06"
 Example 3:

 Input: date = "26th May 1960"
 Output: "1960-05-26"
  

 Constraints:

 The given dates are guaranteed to be valid, so no error handling is necessary.
 */
import XCTest
private class Solution {
    func reformatDate(_ date: String) -> String {
        var output = ""
        var input = date.components(separatedBy: " ")
        var month = convertToMonth(input[1])
        
        var date = ""
        if input[0].count == 4 {
            date = String(input[0].prefix(2))
        } else {
            date = "0" + String(input[0].prefix(1))
        }
        output = input[2] + "-" + month + "-" + date
        return output
    }
    
    func convertToMonth(_ month: String) -> String {
        switch month {
        case "Jan" :
            return "01"
        case "Feb" :
            return "02"
        case "Mar" :
            return "03"
        case "Apr" :
            return "04"
        case "May" :
            return "05"
        case "Jun" :
            return "06"
        case "Jul" :
            return "07"
        case "Aug" :
            return "08"
        case "Sep" :
            return "09"
        case "Oct" :
            return "10"
        case "Nov" :
            return "11"
        case "Dec" :
            return "12"
        default :
            return ""
        }
    }
}
class Q1507__Reformat_Date: XCTestCase {

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
