/*
 2. 两数相加
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

  

 示例 1：
 #imageLiteral(resourceName: "2-图片1.jpg")
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 
 
 示例 2：
 输入：l1 = [0], l2 = [0]
 输出：[0]
 
 
 示例 3：
 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    var l1 = l1
    var l2 = l2
    let head = ListNode.init()
    var tail = head
    var carry = 0
    while l1 != nil || l2 != nil {
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        tail.next = ListNode.init(sum % 10)
        tail = tail.next!
        carry = sum / 10
        l1 = l1?.next
        l2 = l2?.next
    }
    if carry > 0 {
        tail.next = ListNode.init(carry)
    }
    return head.next
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

let l1 = ListNode.init(2, ListNode.init(4, ListNode.init(3)))
let l2 = ListNode.init(5, ListNode.init(6, ListNode.init(4)))

printListNode(addTwoNumbers(l1, l2))
