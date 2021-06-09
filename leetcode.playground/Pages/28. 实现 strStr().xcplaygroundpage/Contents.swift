/*
 28. 实现 strStr()
 
 实现 strStr() 函数。

 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

 
 说明：
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。

  

 示例 1：
 输入：haystack = "hello", needle = "ll"
 输出：2
 
 
 示例 2：
 输入：haystack = "aaaaa", needle = "bba"
 输出：-1
 
 
 示例 3：
 输入：haystack = "", needle = ""
 输出：0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-strstr
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle { return 0 }
    if haystack.count <= needle.count { return -1 }
    var tempStr = haystack
    let count = tempStr.count - needle.count
    for i in 0...count {
        if tempStr.hasPrefix(needle) {
            return i
        }
        tempStr.remove(at: tempStr.startIndex)
    }
    return -1
}

print(strStr("hello", "ll"))
