/*
 39. 组合总和
 
 给定一个无重复元素的正整数数组 candidates 和一个正整数 target ，找出 candidates 中所有可以使数字和为目标数 target 的唯一组合。

 candidates 中的数字可以无限制重复被选取。如果至少一个所选数字数量不同，则两种组合是唯一的。

 对于给定的输入，保证和为 target 的唯一组合数少于 150 个。

  

 示例 1：
 输入: candidates = [2,3,6,7], target = 7
 输出: [[7],[2,2,3]]
 
 
 示例 2：
 输入: candidates = [2,3,5], target = 8
 输出: [[2,2,2,2],[2,3,3],[3,5]]
 
 
 示例 3：
 输入: candidates = [2], target = 1
 输出: []
 
 
 示例 4：
 输入: candidates = [1], target = 1
 输出: [[1]]
 
 
 示例 5：
 输入: candidates = [1], target = 2
 输出: [[1,1]]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func dfs(_ candidates: [Int], _ target: Int, _ ans: inout [[Int]], _ combine: inout [Int], _ idx: Int) {
    if idx == candidates.count { return }
    if target == 0 {
        ans.append(combine)
        return
    }
    dfs(candidates, target, &ans, &combine, idx + 1)
    if target - candidates[idx] >= 0 {
        combine.append(candidates[idx])
        dfs(candidates, target - candidates[idx], &ans, &combine, idx)
        combine.removeLast()
    }
}

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var ans = [[Int]]()
    var combine = [Int]()
    dfs(candidates, target, &ans, &combine, 0)
    return ans
}

print(combinationSum([2,3,6,7], 7))
