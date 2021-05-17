/*
 993. 二叉树的堂兄弟节点
 
 在二叉树中，根节点位于深度 0 处，每个深度为 k 的节点的子节点位于深度 k+1 处。

 如果二叉树的两个节点深度相同，但 父节点不同 ，则它们是一对堂兄弟节点。

 我们给出了具有唯一值的二叉树的根节点 root ，以及树中两个不同节点的值 x 和 y 。

 只有与值 x 和 y 对应的节点是堂兄弟节点时，才返回 true 。否则，返回 false。

  

 示例 1：
 #imageLiteral(resourceName: "993-图片1.png")
 输入：root = [1,2,3,4], x = 4, y = 3
 输出：false
 
 
 示例 2：
 #imageLiteral(resourceName: "993-图片2.png")
 输入：root = [1,2,3,null,4,null,5], x = 5, y = 4
 输出：true
 
 
 示例 3：
 #imageLiteral(resourceName: "993-图片3.png")
 输入：root = [1,2,3,null,4], x = 2, y = 3
 输出：false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cousins-in-binary-tree
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

func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    var x_parent = 0, y_parent = 0
    var x_depth = 0, y_depth = 0
    var x_found = false, y_found = false
    func dfs(_ node: TreeNode?, _ depth: Int, _ parent: Int) {
        guard let node = node else { return }
        if node.val == x {
            x_parent = parent
            x_depth = depth
            x_found = true
        } else if node.val == y {
            y_parent = parent
            y_depth = depth
            y_found = true
        }
        if x_found && y_found { return }
        dfs(node.left, depth + 1, node.val)
        if x_found && y_found { return }
        dfs(node.right, depth + 1, node.val)
    }
    dfs(root, 0, 0)
    return x_depth == y_depth && x_parent != y_parent
}

let tree = TreeNode.init(1, TreeNode.init(2, TreeNode.init(4), nil), TreeNode.init(3))

print(isCousins(tree, 2, 3))
