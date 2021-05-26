/*
 17. 电话号码的字母组合
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

 #imageLiteral(resourceName: "17-图片1.png")

  

 示例 1：
 输入：digits = "23"
 输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
 
 示例 2：
 输入：digits = ""
 输出：[]
 
 
 示例 3：
 输入：digits = "2"
 输出：["a","b","c"]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func letterCombinations(_ digits: String) -> [String] {
    var combinations = [String]()
    if digits.isEmpty { return combinations }
    let phoneMap: [Character:String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"]
    var combination = String()
    backtrack(&combinations, phoneMap, digits.map({$0}), 0, &combination)
    return combinations
}

func backtrack(_ combinations: inout [String], _ phoneMap: [Character:String], _ digits: [Character], _ index: Int, _ combination: inout String) {
    if index == digits.count {
        combinations.append(combination)
    } else {
        let digit = digits[index]
        let letters = (phoneMap[digit] ?? "")
        for letter in letters {
            combination.append(letter)
            backtrack(&combinations, phoneMap, digits, index + 1, &combination)
            combination.remove(at: combination.index(combination.startIndex, offsetBy: index))
        }
    }
}

print(letterCombinations("23"))
