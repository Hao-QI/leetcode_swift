/*
 23. 合并K个升序链表
 
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

  

 示例 1：
 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 
 
 示例 2：
 输入：lists = []
 输出：[]
 
 
 示例 3：
 输入：lists = [[]]
 输出：[]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
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

func merge(_ lists: [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
    if l == r { return lists[l] }
    if l > r { return nil }
    let mid = (l + r) >> 1
    return mergeTwoLists(merge(lists, l, mid), merge(lists, mid + 1, r))
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    return merge(lists, 0, lists.count - 1)
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

let l1 = ListNode.init(1, ListNode.init(4, ListNode.init(5)))
let l2 = ListNode.init(1, ListNode.init(3, ListNode.init(4)))
let l3 = ListNode.init(2, ListNode.init(6))
printListNode(mergeKLists([l1,l2,l3]))
