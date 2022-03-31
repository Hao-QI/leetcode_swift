/*
 728. 自除数
 
 自除数 是指可以被它包含的每一位数整除的数。

 例如，128 是一个 自除数 ，因为 128 % 1 == 0，128 % 2 == 0，128 % 8 == 0。
 
 自除数 不允许包含 0 。

 给定两个整数 left 和 right ，返回一个列表，列表的元素是范围 [left, right] 内所有的 自除数 。

  

 示例 1：
 输入：left = 1, right = 22
 输出：[1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
 
 
 示例 2:
 输入：left = 47, right = 85
 输出：[48,55,66,77]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/self-dividing-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var ans = [Int]()
    for i in left...right {
        var temp = i
        var mark = true
        while temp > 0 {
            let digit = temp % 10
            if digit == 0 || i % digit != 0 {
                mark = false
                break
            }
            temp /= 10
        }
        if mark { ans.append(i) }
    }
    return ans
}

print(selfDividingNumbers(1, 22));
