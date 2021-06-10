/*
 29. 两数相除
 
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

 返回被除数 dividend 除以除数 divisor 得到的商。

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2

  

 示例 1:
 输入: dividend = 10, divisor = 3
 输出: 3
 解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
 
 
 示例 2:
 输入: dividend = 7, divisor = -3
 输出: -2
 解释: 7/-3 = truncate(-2.33333..) = -2

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/divide-two-integers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 { return 0 }
    if divisor == 1 { return dividend }
    if divisor == -1 {
        return dividend > Int32.min ? -dividend : Int(Int32.max)
    }
    var sign = 1, dividend = dividend, divisor = divisor
    if (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0) {
        sign = -1
    }
    if dividend < 0 { dividend = -dividend }
    if divisor < 0 { divisor = -divisor }
    if dividend < divisor { return 0 }
    var count = 1
    var temp = divisor
    while temp + temp < dividend {
        temp = temp + temp
        count = count + count
    }
    let result = count + divide(dividend - temp, divisor)
    return sign > 0 ? result : -result
}

print(divide(10, 3))
