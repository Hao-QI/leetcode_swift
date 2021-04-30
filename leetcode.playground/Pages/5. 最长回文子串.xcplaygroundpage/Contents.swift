/*
 5. 最长回文子串
 
 给你一个字符串 s，找到 s 中最长的回文子串。

  

 示例 1：
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 
 
 示例 2：
 输入：s = "cbbd"
 输出："bb"
 
 
 示例 3：
 输入：s = "a"
 输出："a"
 
 
 示例 4：
 输入：s = "ac"
 输出："a"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func longestPalindrome(_ s: String) -> String {
    let arr = s.map({$0})
    print(arr)
    var start = 0, end = 0, n = s.count
    for i in 0..<n {
        var a = i, b = i
        while a >= 0, b < n, arr[a] == arr[b] {
            a -= 1
            b += 1
        }
        a += 1
        b -= 1
        var c = i, d = i + 1
        while c >= 0, d < n, arr[c] == arr[d] {
            c -= 1
            d += 1
        }
        c += 1
        d -= 1
        if b - a > end - start {
            (start, end) = (a, b)
        }
        if d - c > end - start {
            (start, end) = (c, d)
        }
    }
    return String(arr[start...end])
}

print(longestPalindrome("aacabdkacaa"))
