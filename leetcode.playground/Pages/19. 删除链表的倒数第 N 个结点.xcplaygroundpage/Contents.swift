/*
 19. 删除链表的倒数第 N 个结点
 
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

 进阶：你能尝试使用一趟扫描实现吗？

  

 示例 1：
 #imageLiteral(resourceName: "19-图片1.jpg")
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 
 示例 2：
 输入：head = [1], n = 1
 输出：[]
 
 
 示例 3：
 输入：head = [1,2], n = 1
 输出：[1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode.init(0, head)
    var first = dummy
    var second = dummy
    for _ in 0..<n {
        first = first.next!
    }
    while first.next != nil {
        first = first.next!
        second = second.next!
    }
    second.next = second.next!.next
    return dummy.next
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

let node = ListNode.init(1, ListNode.init(2, ListNode.init(3, ListNode.init(4, ListNode.init(5)))))
printListNode(removeNthFromEnd(node, 2))

