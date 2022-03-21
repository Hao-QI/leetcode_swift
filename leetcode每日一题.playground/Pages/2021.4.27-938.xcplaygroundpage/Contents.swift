/*
 938. 二叉搜索树的范围和
 
 给定二叉搜索树的根结点 root，返回值位于范围 [low, high] 之间的所有结点的值的和。

  

 示例 1：
 #imageLiteral(resourceName: "938-图片1.jpg")
 输入：root = [10,5,15,3,7,null,18], low = 7, high = 15
 输出：32
 
 
 示例 2：
 #imageLiteral(resourceName: "938-图片2.jpg")
 输入：root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
 输出：2

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-of-bst
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

func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root = root else { return 0 }
    if root.val > high {
        return rangeSumBST(root.left, low, high)
    }
    if root.val < low {
        return rangeSumBST(root.right, low, high)
    }
    return root.val + rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
}

// 实例1：[10,5,15,3,7,null,18]
let tree = TreeNode.init(10, TreeNode.init(5, TreeNode.init(3), TreeNode.init(7)), TreeNode.init(15, nil, TreeNode.init(18)))
print(rangeSumBST(tree, 7, 15))
