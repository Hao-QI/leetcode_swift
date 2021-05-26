/*
 18. 四数之和
 
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

 注意：答案中不可以包含重复的四元组。

  

 示例 1：
 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 
 示例 2：
 输入：nums = [], target = 0
 输出：[]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/4sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var quadruplets = [[Int]]()
    if nums.count < 4 { return quadruplets }
    let nums = nums.sorted()
    let length = nums.count
    for i in 0..<(length - 3) {
        if i > 0 && nums[i] == nums[i - 1] { continue }
        if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target { break }
        if nums[i] + nums[length - 3] + nums[length - 2] + nums[length - 1] < target { continue }
        for j in (i + 1)..<(length - 2) {
            if j > i + 1 && nums[j] == nums[j - 1] { continue }
            if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target { break }
            if nums[i] + nums[j] + nums[length - 2] + nums[length - 1] < target { continue }
            var left = j + 1, right = length - 1
            while left < right {
                let sum = nums[i] + nums[j] + nums[left] + nums[right]
                if sum == target {
                    quadruplets.append([nums[i],nums[j],nums[left],nums[right]])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    left += 1
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    right -= 1
                } else if (sum < target) {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    return quadruplets
}

print(fourSum([1,0,-1,0,-2,2], 0))
