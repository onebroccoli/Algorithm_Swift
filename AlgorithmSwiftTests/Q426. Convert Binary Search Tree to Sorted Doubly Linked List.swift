//
//  Q426. Convert Binary Search Tree to Sorted Doubly Linked List.swift
//  AlgorithmSwiftTests
//
//  Created by Sophia Zhu on 2/25/22.
//
/*
 426. Convert Binary Search Tree to Sorted Doubly Linked List
 Convert a Binary Search Tree to a sorted Circular Doubly-Linked List in place.

 You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

 We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.

  

 Example 1:



 Input: root = [4,2,5,1,3]


 Output: [1,2,3,4,5]

 Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

 Example 2:

 Input: root = [2,1,3]
 Output: [1,2,3]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 All the values of the tree are unique.
 */

/*
 转化成双向链表的每个结点都有 left 和 right 指针指向左右两个结点，不管其原来是否是叶结点还是根结点，转换后统统没有区别。
 循环双向链表，即首尾结点是相连的，原先的二叉搜索树中的最左结点和最右结点，现在也互相连接起来了。
 最后，返回的结点不再是原二叉搜索树的根结点 root 了，而是最左结点，即最小值结点。
 
   4
   /\
  2  5
 / \
 1 3
 1-> 2-> 3-> 4-> 5
 <-   <-  <-  <-
 
 原二叉搜索树中结点4连接着结点2和结点5
 双向链表中，连接的是结点3和结点5
 只有中序遍历，结点3之后才会遍历到结点4，这时候可以将结点3和结点4串起来
 binary search tree: Left root right
 决定了用中序遍历之后，就要考虑是迭代还是递归的写法，博主建议写递归的，一般写起来都比较简洁，而且递归是解树类问题的神器啊，十有八九都是用递归，一定要熟练掌握。
 
 再写中序遍历之前，其实还有难点，因为需要把相邻的结点连接起来，所以需要知道上一个遍历到的结点是什么，
 所以用一个变量 pre，来记录上一个遍历到的结点。
 还需要一个变量head，来记录最左结点，这样的话，在递归函数中，先判空，之后对左子结点调用递归，这样会先一直递归到最左结点，
 此时如果 head 为空的话，说明当前就是最左结点，赋值给 head 和 pre，
 对于之后的遍历到的结点，那么可以和 pre 相互连接上，然后 pre 赋值为当前结点 node，再对右子结点调用递归即可
 
 */
import XCTest
private class BNode {
    public var val: Int
    public var left: BNode?
    public var right: BNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

private class Solution {
    var prev: BNode? = nil
    var head: BNode? = nil
    func treeToDoublyList(_ root: BNode?) -> BNode? {
        guard let root = root else  {return nil}
        dfs(root)
        head?.left = prev
        prev?.right = head
        return head
        
        
        
    }
    
    func dfs(_ node: BNode?) {
        guard let current = node else {return}
        dfs(current.left)
        
        if let _ = prev {
            current.left = prev
            prev?.right = current
        } else {
            head = current
        }
        prev = current
        dfs(current.right)
    }
}
class Q426__Convert_Binary_Search_Tree_to_Sorted_Doubly_Linked_List: XCTestCase {

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
