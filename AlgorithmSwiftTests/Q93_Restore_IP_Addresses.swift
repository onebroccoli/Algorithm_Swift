//
//  Q93_Restore_IP_Addresses.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 8/4/21.
//
/*
 Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.

 A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses.

  

 Example 1:

 Input: s = "25525511135"
 Output: ["255.255.11.135","255.255.111.35"]
 Example 2:

 Input: s = "0000"
 Output: ["0.0.0.0"]
 Example 3:

 Input: s = "1111"
 Output: ["1.1.1.1"]
 Example 4:

 Input: s = "010010"
 Output: ["0.10.0.10","0.100.1.0"]
 Example 5:

 Input: s = "101023"
 Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
  
 */
import XCTest
private class Solution {
//    func restoreIpAddresses(_ s: String) -> [String]{
//        //sanity check
//        if s.count < 4 || s.count > 1 {
//            return []
//        }
//        let chars = Array(s)
//        var result = [String]()
//        var candidate = [String]()
//        dfs(chars, 0, &candidate, &result)
//        return result
//    }
//
//    func dfs(_ characters: [Character], _ index: Int, _ candidate: inout [String], _ result: inout [Strig]) {
//        if candidate.count  == 4 {
//            result.append(candidate.joined(separator: "."))
//            return
//        }
//
//
//    }
    
    func restoreIpAddresses(_ s: String) -> [String]{
        var result = [String]()
        var candidate = [String]()
        if s.count == 0 {
            return result
        }
        dfs(Array(s), 0, 0, &candidate, &result)
        return result
    }

    func dfs(_ ip: [Character], _ level: Int, _ index: Int, _ candidate: inout [String], _ result: inout [String]) {
        if level == 4 {
            if index == ip.count {
                result.append(candidate.joined(separator: "."))
            }            
            return
        }
            
        //case 1
        if index < ip.count {
            let num = String(ip[index])
            candidate.append(num)
            dfs(ip, level + 1, index + 1, &candidate, &result)
            candidate.removeLast()
        }
        
        //case 2 2digits
        if index + 1 < ip.count {
            let a = String(ip[index])
            let b = String(ip[index + 1])
            if a != "0" {
                let num = a + b
//                let num = String(ip[index..<(index + 1 + 1)])
                candidate.append(num)
                dfs(ip, level + 1, index + 2, &candidate, &result)
                candidate.removeLast()
            }
        }
        //case3: 3 digits
        if index + 2 < ip.count {
            let a = String(ip[index])
            let b = String(ip[index + 1])
            let c = String(ip[index + 2])
            //logic:
            //1) a = 1
            //2) a = 2, b <5
            //3) a = 2, b = 5, c <= 5
            if (a == "1" || (a == "2" && b >= "0" && b <= "4") || (a == "2" && b == "5" && c >= "0" && c <= "5")) {
//                let num = String(ip[index..<(index + 2 + 1)])
                let num = a + b + c
                candidate.append(num)
                dfs(ip, level + 1, index + 3, &candidate, &result)
                candidate.removeLast()
            }
        }
    }
}


class Q93_Restore_IP_Addresses: XCTestCase {

   

    func testExample() throws {
        let s = Solution()
        let result = s.restoreIpAddresses("25525511135") //"0000","101023" ,"25525511135"
        print (result)
        
//        let result2 = s.restoreIpAddresses("0000")
//        print (result2)
//
//        let result3 = s.restoreIpAddresses("101023")
//        print (result3)
    }

}
