/*
 930. 和相同的二元子数组
 
 给你一个二元数组 nums ，和一个整数 goal ，请你统计并返回有多少个和为 goal 的 非空 子数组。

 子数组 是数组的一段连续部分。

  

 示例 1：
 输入：nums = [1,0,1,0,1], goal = 2
 输出：4
 解释：
 有 4 个满足题目要求的子数组：[1,0,1]、[1,0,1,0]、[0,1,0,1]、[1,0,1]
 
 
 示例 2：
 输入：nums = [0,0,0,0,0], goal = 0
 输出：15

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-subarrays-with-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    let n = nums.count
    var left1 = 0, left2 = 0, right = 0
    var sum1 = 0, sum2 = 0
    var ret = 0
    while right < n {
        sum1 += nums[right]
        while left1 <= right && sum1 > goal {
            sum1 -= nums[left1]
            left1 += 1
        }
        sum2 += nums[right]
        while left2 <= right && sum2 >= goal {
            sum2 -= nums[left2]
            left2 += 1
        }
        ret += left2 - left1
        right += 1
    }
    return ret
}

print(numSubarraysWithSum([1,0,1,0,1], 2))
