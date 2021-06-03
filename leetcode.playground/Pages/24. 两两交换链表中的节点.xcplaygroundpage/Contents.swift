/*
 24. 两两交换链表中的节点
 
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例 1：
 #imageLiteral(resourceName: "24-图片1.jpg")
 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 
 
 示例 2：
 输入：head = []
 输出：[]
 
 
 示例 3：
 输入：head = [1]
 输出：[1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func swapPairs(_ head: ListNode?) -> ListNode? {
    let dummyHead = ListNode.init()
    dummyHead.next = head
    var temp = dummyHead
    while let node1 = temp.next, let node2 = node1.next {
        temp.next = node2
        node1.next = node2.next
        node2.next = node1
        temp = node1
    }
    return dummyHead.next
}

// 打印链表
func printListNode(_ list: ListNode?) {
    guard list != nil else {
        print("传入链表为空")
        return
    }
    var list = list
    var arr: [Int] = Array()
    while list != nil {
        arr.append(list?.val ?? 0)
        list = list?.next
    }
    print(arr)
}

let node = ListNode.init(1, ListNode.init(2, ListNode.init(3, ListNode.init(4))))
printListNode(swapPairs(node))
