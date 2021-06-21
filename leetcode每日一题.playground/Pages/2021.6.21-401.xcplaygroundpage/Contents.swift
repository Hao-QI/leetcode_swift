/*
 401. 二进制手表

 二进制手表顶部有 4 个 LED 代表 小时（0-11），底部的 6 个 LED 代表 分钟（0-59）。每个 LED 代表一个 0 或 1，最低位在右侧。

 例如，下面的二进制手表读取 "3:25" 。
 #imageLiteral(resourceName: "401-图片1.jpg")

 给你一个整数 turnedOn ，表示当前亮着的 LED 的数量，返回二进制手表可以表示的所有可能时间。你可以 按任意顺序 返回答案。

 小时不会以零开头：
 例如，"01:00" 是无效的时间，正确的写法应该是 "1:00" 。
 
 分钟必须由两位数组成，可能会以零开头：
 例如，"10:2" 是无效的时间，正确的写法应该是 "10:02" 。
  

 
 示例 1：
 输入：turnedOn = 1
 输出：["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]
 
 
 示例 2：
 输入：turnedOn = 9
 输出：[]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-watch
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func readBinaryWatch(_ turnedOn: Int) -> [String] {
    if turnedOn >= 9 {
        return []
    }
    let hours = [1, 2, 4, 8]
    let mins = [1, 2, 4, 8, 16, 32]
    var ans = [String]()
    for index in 0...turnedOn {
        var hourStrings = [String]()
        var minStrings = [String]()
        var hour = 0
        var min = 0
        var hourAddedCount = 0
        var minAddedCount = 0
        dfsNum(&hourStrings, &hour, 11, index, &hourAddedCount, 0, hours)
        dfsNum(&minStrings, &min, 59, turnedOn - index, &minAddedCount, 0, mins)
        for hour in hourStrings {
            for min in minStrings {
                ans.append(String(hour) + ":" + String(min))
            }
        }
    }
    return ans
}

func dfsNum(_ results: inout [String], _ result: inout Int, _ maxResult: Int, _ count: Int, _ addedCount: inout Int, _ start: Int, _ nums: [Int]) {
    if count == 0 {
        if maxResult == 59 {
            results.append("00")
        } else {
            results.append("0")
        }
        return
    }
    if addedCount == count {
        var string = String(result)
        if maxResult == 59 && result < 10 {
            string = "0" + string
        }
        results.append(string)
        return
    }
    for index in start..<nums.count {
        let val = nums[index]
        if result + val > maxResult {
            break
        }
        result += val
        addedCount += 1
        dfsNum(&results, &result, maxResult, count, &addedCount, index + 1, nums)
        addedCount -= 1
        result -= val
    }
}

print(readBinaryWatch(1))
