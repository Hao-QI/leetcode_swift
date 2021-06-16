/*
 32. 最长有效括号
 
 给你一个只包含 '(' 和 ')' 的字符串，找出最长有效（格式正确且连续）括号子串的长度。

  

 示例 1：
 输入：s = "(()"
 输出：2
 解释：最长有效括号子串是 "()"
 
 
 示例 2：
 输入：s = ")()())"
 输出：4
 解释：最长有效括号子串是 "()()"
 
 
 示例 3：
 输入：s = ""
 输出：0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func longestValidParentheses(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    let n = s.count, s = Array(s)
    var maxans = 0
    var dp = Array.init(repeating: 0, count: n)
    for i in 1..<n {
        if s[i] == ")" {
            if s[i - 1] == "(" {
                dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2
            } else if i - dp[i - 1] > 0 && s[i - dp[i - 1] - 1] == "(" {
                dp[i] = dp[i - 1] + ((i - dp[i - 1]) >= 2 ? dp[i - dp[i - 1] - 2] : 0) + 2;
            }
            maxans = max(maxans, dp[i])
        }
    }
    return maxans
}

print(longestValidParentheses("(()"))
