/*
 22. 括号生成
 
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

  

 示例 1：
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 
 
 示例 2：
 输入：n = 1
 输出：["()"]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func generateParenthesis(_ n: Int) -> [String] {
    var ans = [String]()
    backtrack(&ans, "", 0, 0, n)
    return ans
}

func backtrack(_ ans: inout [String], _ cur: String, _ open: Int, _ close: Int, _ n: Int) {
    if cur.count == n * 2 {
        ans.append(cur)
        return
    }
    if open < n {
        backtrack(&ans, cur + "(", open + 1, close, n)
    }
    if close < open {
        backtrack(&ans, cur + ")", open, close + 1, n)
    }
}

print(generateParenthesis(3))
