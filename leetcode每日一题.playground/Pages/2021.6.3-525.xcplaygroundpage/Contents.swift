/*
 525. 连续数组
 
 给定一个二进制数组 nums , 找到含有相同数量的 0 和 1 的最长连续子数组，并返回该子数组的长度。

  

 示例 1:
 输入: nums = [0,1]
 输出: 2
 说明: [0, 1] 是具有相同数量0和1的最长连续子数组。
 
 
 示例 2:
 输入: nums = [0,1,0]
 输出: 2
 说明: [0, 1] (或 [1, 0]) 是具有相同数量0和1的最长连续子数组。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/contiguous-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func findMaxLength(_ nums: [Int]) -> Int {
    var maxLength = 0, counter = 0
    var mp = [Int:Int]()
    mp[counter] = -1
    for (index, num) in nums.enumerated() {
        if num == 1 {
            counter += 1
        } else {
            counter -= 1
        }
        if let prevIndex = mp[counter] {
            maxLength = max(maxLength, index - prevIndex)
        } else {
            mp[counter] = index
        }
    }
    return maxLength
}

print(findMaxLength([0,1]))
