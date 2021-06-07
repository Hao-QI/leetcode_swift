/*
 494. 目标和
 
 给你一个整数数组 nums 和一个整数 target 。

 向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：

 例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
 返回可以通过上述方法构造的、运算结果等于 target 的不同 表达式 的数目。

  

 示例 1：
 输入：nums = [1,1,1,1,1], target = 3
 输出：5
 解释：一共有 5 种方法让最终目标和为 3 。
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 
 
 示例 2：
 输入：nums = [1], target = 1
 输出：1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/target-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var sum = 0
    for num in nums {
        sum += num
    }
    if target > sum { return 0 }
    if (sum + target) % 2 != 0 { return 0 }
    let neg = (sum + target) / 2
    var dp = Array.init(repeating: 0, count: (neg + 1))
    dp[0] = 1
    for num in nums {
        var j = neg
        while j >= num {
            dp[j] += dp[j - num]
            j -= 1
        }
    }
    return dp[neg]
}

print(findTargetSumWays([1,1,1,1,1], 3))
