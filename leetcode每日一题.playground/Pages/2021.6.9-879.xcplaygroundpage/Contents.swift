/*
 879. 盈利计划
 
 集团里有 n 名员工，他们可以完成各种各样的工作创造利润。

 第 i 种工作会产生 profit[i] 的利润，它要求 group[i] 名成员共同参与。如果成员参与了其中一项工作，就不能参与另一项工作。

 工作的任何至少产生 minProfit 利润的子集称为 盈利计划 。并且工作的成员总数最多为 n 。

 有多少种计划可以选择？因为答案很大，所以 返回结果模 10^9 + 7 的值。

  

 示例 1：
 输入：n = 5, minProfit = 3, group = [2,2], profit = [2,3]
 输出：2
 解释：至少产生 3 的利润，该集团可以完成工作 0 和工作 1 ，或仅完成工作 1 。
 总的来说，有两种计划。
 
 
 示例 2：
 输入：n = 10, minProfit = 5, group = [2,3,5], profit = [6,7,8]
 输出：7
 解释：至少产生 5 的利润，只要完成其中一种工作就行，所以该集团可以完成任何工作。
 有 7 种可能的计划：(0)，(1)，(2)，(0,1)，(0,2)，(1,2)，以及 (0,1,2) 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/profitable-schemes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
    var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: minProfit + 1), count: n + 1)
    for i in 0...n {
        dp[i][0] = 1
    }
    let len = group.count, MOD = Int(1e9 + 7)
    for i in 1...len {
        let members = group[i - 1], earn = profit[i - 1]
        var j = n
        while j >= members {
            var k = minProfit
            while k >= 0 {
                dp[j][k] = (dp[j][k] + dp[j - members][max(0, k - earn)]) % MOD
                k -= 1
            }
            j -= 1
        }
    }
    return dp[n][minProfit]
}

print(profitableSchemes(5, 3, [2,2], [2,3]))
