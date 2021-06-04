/*
 25. K 个一组翻转链表
 
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

 进阶：
 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
  

 
 示例 1：
 #imageLiteral(resourceName: "25-图片1.jpg")
 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 
 
 示例 2：
 #imageLiteral(resourceName: "25-图片2.jpg")
 输入：head = [1,2,3,4,5], k = 3
 输出：[3,2,1,4,5]
 
 
 示例 3：
 输入：head = [1,2,3,4,5], k = 1
 输出：[1,2,3,4,5]
 
 
 示例 4：
 输入：head = [1], k = 1
 输出：[1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-nodes-in-k-group
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

func myReverse(_ head: ListNode?, _ tail: ListNode?) -> (head: ListNode?, tail: ListNode?) {
    var prev = tail?.next, p = head
    while prev !== tail {
        let nex = p?.next
        p?.next = prev
        prev = p
        p = nex
    }
    return (tail, head)
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var head = head
    let hair = ListNode.init()
    hair.next = head
    var pre: ListNode? = hair
    while head != nil {
        var tail: ListNode? = pre
        // 查看剩余部分长度是否大于等于 k
        for _ in 0..<k {
            tail = tail?.next
            if tail == nil {
                return hair.next
            }
        }
        let nex = tail?.next
        let result = myReverse(head, tail)
        head = result.head
        tail = result.tail
        // 把子链表重新接回原链表
        pre?.next = head
        tail?.next = nex
        pre = tail
        head = tail?.next
    }
    return hair.next
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

let head = ListNode.init(1, ListNode.init(2, ListNode.init(3, ListNode.init(4, ListNode.init(5)))))
printListNode(reverseKGroup(head, 2))
