/*
 30. 串联所有单词的子串
 
 给定一个字符串 s 和一些 长度相同 的单词 words 。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。

 注意子串要与 words 中的单词完全匹配，中间不能有其他字符 ，但不需要考虑 words 中单词串联的顺序。

  

 示例 1：
 输入：s = "barfoothefoobarman", words = ["foo","bar"]
 输出：[0,9]
 解释：
 从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
 输出的顺序不重要, [9,0] 也是有效答案。
 
 
 示例 2：
 输入：s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
 输出：[]
 
 
 示例 3：
 输入：s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
 输出：[6,9,12]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    if s.isEmpty || words.isEmpty { return [] }
    let n = s.count
    let chars = Array(s)
    let wordsNum = words.count
    let wordSize = words[0].count
    let len = wordsNum * wordSize
    if n < len { return [] }
    var wordDic = [[Character]: Int]()
    for word in words {
        let temp = Array(word)
        wordDic[temp] = (wordDic[temp] ?? 0) + 1
    }
    var res = [Int]()
    for i in 0..<wordSize {
        var left = i
        while left <= (n - len) {
            var right = left + len
            var dic = [[Character]: Int]()
            var isEqual = true
            while left < right {
                let temp = Array(chars[(right - wordSize)..<right])
                dic[temp] = (dic[temp] ?? 0) + 1
                if dic[temp]! > (wordDic[temp] ?? 0) {
                    isEqual = false
                    break
                }
                right -= wordSize
            }
            if isEqual {
                if dic == wordDic {
                    res.append(left)
                }
                left += wordSize
            } else {
                left = right
            }
        }
    }
    return res
}

print(findSubstring("barfoothefoobarman", ["foo","bar"]))
