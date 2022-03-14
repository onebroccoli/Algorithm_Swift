//
//  Q721. Accounts Merge.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 3/9/22.
//
/*
 721. Accounts Merge
 Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.

 Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.

 After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.

  

 Example 1:

 Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
 Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
 Explanation:
 The first and second John's are the same person as they have the common email "johnsmith@mail.com".
 The third John and Mary are different people as none of their email addresses are used by other accounts.
 We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'],
 ['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.
 Example 2:

 Input: accounts = [["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]
 Output: [["Ethan","Ethan0@m.co","Ethan4@m.co","Ethan5@m.co"],["Gabe","Gabe0@m.co","Gabe1@m.co","Gabe3@m.co"],["Hanzo","Hanzo0@m.co","Hanzo1@m.co","Hanzo3@m.co"],["Kevin","Kevin0@m.co","Kevin3@m.co","Kevin5@m.co"],["Fern","Fern0@m.co","Fern1@m.co","Fern5@m.co"]]
  

 Constraints:

 1 <= accounts.length <= 1000
 2 <= accounts[i].length <= 10
 1 <= accounts[i][j] <= 30
 accounts[i][0] consists of English letters.
 accounts[i][j] (for j > 0) is a valid email.
 */
import XCTest
private class Solution {
func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var emailRelation = [String: Set<String>]()
    var emailToName = [String: String]()
    buildGraph(accounts, &emailRelation, &emailToName)
    return dfs(emailRelation, emailToName)
    
}


func buildGraph(_ accounts: [[String]], _ emailRelation: inout [String: Set<String>], _ emailToName: inout [String: String]) {
    for acct in accounts {
        let name = acct[0] //first is name
        let emails = Array(acct[1...]) //rest are emails
        let first = emails[0] //pick first email
        
        for email in emails {
            emailRelation[first, default: []].insert(email)
            emailRelation[email,default: []].insert(first)
            emailToName[email] = name
        }
    }
}

func dfs(_ emailRelation: [String: Set<String>], _ emailToName: [String: String]) -> [[String]] {
    var result: [[String]] = []
    var visited = Set<String>()
    
    for email in emailRelation.keys {
        //Not in visited
        if !visited.contains(email) {
            visited.insert(email)
            
            var stack: [String] = []
            var emailList: [String] = []
            
            stack.append(email)
            
            while !stack.isEmpty {
                let temp = stack.removeLast()
                emailList.append(temp)
                
                for neighbor in emailRelation[temp]! where !visited.contains(neighbor) {
                    visited.insert(neighbor)
                    stack.append(neighbor)
                }
            }
            
            result.append([emailToName[email]!] + emailList.sorted())
        }
    }
    return result
}
}
class Q721__Accounts_Merge: XCTestCase {

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
