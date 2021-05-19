/*
 16. 最接近的三数之和
 
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

  

 示例：
 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum-closest
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var nums = nums.sorted()
    let n = nums.count
    var best = Int(Int32.max)
    // 枚举 a
    for i in 0..<n {
        // 保证和上一次枚举的元素不相等
        if i > 0 && nums[i] == nums[i - 1] { continue }
        // 使用双指针枚举 b 和 c
        var j = i + 1, k = n - 1
        while j < k {
            let sum = nums[i] + nums[j] + nums[k]
            if sum == target { return target }
            // 根据差值的绝对值来更新答案
            if abs(sum - target) < abs(best - target) {
                best = sum
            }
            if sum > target {
                // 如果和大于 target，移动 c 对应的指针
                var k0 = k - 1
                // 移动到下一个不相等的元素
                while j < k0 && nums[k0] == nums[k] {
                    k0 -= 1
                }
                k = k0
            } else {
                // 如果和小于 target，移动 b 对应的指针
                var j0 = j + 1
                // 移动到下一个不相等的元素
                while j0 < k && nums[j0] == nums[j] {
                    j0 += 1
                }
                j = j0
            }
        }
    }
    return best
}

print(threeSumClosest([-1,2,1,-4], 1))
