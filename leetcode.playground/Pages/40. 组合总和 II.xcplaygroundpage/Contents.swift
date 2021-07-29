/*
 40. 组合总和 II
 
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

 candidates 中的每个数字在每个组合中只能使用一次。

 注意：解集不能包含重复的组合。

  

 示例 1:
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 输出:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 
 
 示例 2:
 输入: candidates = [2,5,2,1,2], target = 5,
 输出:
 [
 [1,2,2],
 [5]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

var freq = [(Int, Int)]()
var ans = [[Int]]()
var sequence = [Int]()

func dfs(_ pos: Int, _ rest: Int) {
    if rest == 0 {
        ans.append(sequence)
        return
    }
    if pos == freq.count || rest < freq[pos].0 {
        return
    }
    
    dfs(pos + 1, rest)
    
    let most = min(rest / freq[pos].0, freq[pos].1)
    for i in 1...most {
        sequence.append(freq[pos].0)
        dfs(pos + 1, rest - i * freq[pos].0)
    }
    for _ in 1...most {
        sequence.removeLast()
    }
}

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted()
    for num in candidates {
        if freq.isEmpty || num != freq.last!.0 {
            freq.append((num, 1))
        } else {
            let temp = freq.last!.1
            freq.removeLast()
            freq.append((num, temp + 1))
        }
    }
    dfs(0, target)
    return ans
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
