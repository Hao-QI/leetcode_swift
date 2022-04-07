/*
 796. 旋转字符串
 
 给定两个字符串, s 和 goal。如果在若干次旋转操作之后，s 能变成 goal ，那么返回 true 。

 s 的 旋转操作 就是将 s 最左边的字符移动到最右边。

 例如, 若 s = 'abcde'，在旋转一次之后结果就是'bcdea' 。
  

 
 示例 1:
 输入: s = "abcde", goal = "cdeab"
 输出: true
 
 
 示例 2:
 输入: s = "abcde", goal = "abced"
 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func rotateString(_ s: String, _ goal: String) -> Bool {
    let n = s.count, m = goal.count
    if n != m { return false }
    let s = s.map{ $0 }, goal = goal.map{ $0 }
    var start = 0, i = start, j = 0
    while start < n && j < m {
        if s[i % n] == goal[j] {
            i += 1
            j += 1
        } else {
            start += 1
            i = start
            j = 0
        }
    }
    return j == m ? true : false
}

print(rotateString("abcde", "cdeab"))
