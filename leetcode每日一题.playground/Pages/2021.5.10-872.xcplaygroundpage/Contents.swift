/*
 872. 叶子相似的树
 
 请考虑一棵二叉树上所有的叶子，这些叶子的值按从左到右的顺序排列形成一个 叶值序列 。
 #imageLiteral(resourceName: "872-图片1.png")
 举个例子，如上图所示，给定一棵叶值序列为 (6, 7, 4, 9, 8) 的树。

 如果有两棵二叉树的叶值序列是相同，那么我们就认为它们是 叶相似 的。

 如果给定的两个根结点分别为 root1 和 root2 的树是叶相似的，则返回 true；否则返回 false 。
 
 
 
 示例 1：
 #imageLiteral(resourceName: "872-图片2.jpg")
 输入：root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
 输出：true
 
 
 示例 2：
 输入：root1 = [1], root2 = [1]
 输出：true
 
 
 示例 3：
 输入：root1 = [1], root2 = [2]
 输出：false
 
 
 示例 4：
 输入：root1 = [1,2], root2 = [2,2]
 输出：true
 
 
 示例 5：
 #imageLiteral(resourceName: "872-图片3.jpg")
 输入：root1 = [1,2,3], root2 = [1,3,2]
 输出：false
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/leaf-similar-trees
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

func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    var arr1 = [Int]()
    var arr2 = [Int]()
    getTreeLeaf(root1, &arr1)
    getTreeLeaf(root2, &arr2)
    return arr1 == arr2
}

func getTreeLeaf(_ root: TreeNode?, _ arr: inout [Int]) {
    guard let root = root else { return }
    if root.left == nil && root.right == nil {
        arr.append(root.val)
        return
    }
    getTreeLeaf(root.left, &arr)
    getTreeLeaf(root.right, &arr)
}

let tree1 = TreeNode.init(3, TreeNode.init(5, TreeNode.init(6), TreeNode.init(2, TreeNode.init(7), TreeNode.init(4))), TreeNode.init(1, TreeNode.init(9), TreeNode.init(8)))
let tree2 = TreeNode.init(3, TreeNode.init(5, TreeNode.init(6), TreeNode.init(7)), TreeNode.init(1, TreeNode.init(4), TreeNode.init(2, TreeNode.init(9), TreeNode.init(8))))

print(leafSimilar(tree1, tree2))
