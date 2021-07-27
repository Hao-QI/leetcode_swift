/*
 671. 二叉树中第二小的节点
 
 给定一个非空特殊的二叉树，每个节点都是正数，并且每个节点的子节点数量只能为 2 或 0。如果一个节点有两个子节点的话，那么该节点的值等于两个子节点中较小的一个。

 更正式地说，root.val = min(root.left.val, root.right.val) 总成立。

 给出这样的一个二叉树，你需要输出所有节点中的第二小的值。如果第二小的值不存在的话，输出 -1 。

  

 示例 1：
 #imageLiteral(resourceName: "671-图片1.jpg")
 输入：root = [2,2,5,null,null,5,7]
 输出：5
 解释：最小的值是 2 ，第二小的值是 5 。
 
 
 示例 2：
 #imageLiteral(resourceName: "671-图片2.jpg")
 输入：root = [2,2,2]
 输出：-1
 解释：最小的值是 2, 但是不存在第二小的值。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/second-minimum-node-in-a-binary-tree
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

func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    guard let minVal = root?.val else { return -1 }
    var ans = Int.max
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        
        if node.val == minVal {
            dfs(node.left)
            dfs(node.right)
        } else {
            ans = min(ans, node.val)
        }
    }
    
    dfs(root)
    return ans == Int.max ? -1 : ans
}

let tree = TreeNode.init(2, TreeNode.init(2), TreeNode.init(5, TreeNode.init(5), TreeNode.init(7)))
print(findSecondMinimumValue(tree))
