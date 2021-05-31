/*
 21. 合并两个有序链表
 
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

  

 示例 1：
 #imageLiteral(resourceName: "21-图片1.jpg")
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 
 示例 2：
 输入：l1 = [], l2 = []
 输出：[]
 
 
 示例 3：
 输入：l1 = [], l2 = [0]
 输出：[0]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
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

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    let dummyHead = ListNode.init()
    var prev = dummyHead
    while l1 != nil && l2 != nil {
        if (l1?.val)! < (l2?.val)! {
            prev.next = l1
            l1 = l1?.next
        } else {
            prev.next = l2
            l2 = l2?.next
        }
        prev = prev.next!
    }
    prev.next = l1 ?? l2
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

let l1 = ListNode.init(1, ListNode.init(2, ListNode.init(4)))
let l2 = ListNode.init(1, ListNode.init(3, ListNode.init(4)))
printListNode(mergeTwoLists(l1, l2))
