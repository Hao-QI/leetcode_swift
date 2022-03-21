/*
 653. 两数之和 IV - 输入 BST
 
 给定一个二叉搜索树 root 和一个目标结果 k，如果 BST 中存在两个元素且它们的和等于给定的目标结果，则返回 true。

  

 示例 1：
 #imageLiteral(resourceName: "653-图片1.jpg")
 输入: root = [5,3,6,2,4,null,7], k = 9
 输出: true
 
 
 示例 2：
 #imageLiteral(resourceName: "653-图片2.jpg")
 输入: root = [5,3,6,2,4,null,7], k = 28
 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum-iv-input-is-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    var arr = [Int]()
    dfs(root, &arr)
    let count = arr.count
    var l = 0, r = count - 1
    while l < r {
        if arr[l] + arr[r] == k { return true }
        else if arr[l] + arr[r] > k { r -= 1 }
        else { l += 1 }
    }
    return false
}

func dfs(_ node: TreeNode?, _ arr: inout [Int]) {
    guard let node = node else { return }
    dfs(node.left, &arr)
    arr.append(node.val)
    dfs(node.right, &arr)
}

// 实例1：[5,3,6,2,4,null,7]
let tree = TreeNode.init(5, TreeNode.init(3, TreeNode.init(2), TreeNode.init(4)), TreeNode.init(6, nil, TreeNode.init(7)))
print(findTarget(tree, 9))
