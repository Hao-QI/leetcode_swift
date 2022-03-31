/*
 41. 缺失的第一个正数
 
 给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。

 请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
  

 示例 1：
 输入：nums = [1,2,0]
 输出：3
 
 
 示例 2：
 输入：nums = [3,4,-1,1]
 输出：2
 
 
 示例 3：
 输入：nums = [7,8,9,11,12]
 输出：1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-missing-positive
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums
    let n = nums.count
    for i in 0..<n {
        if nums[i] <= 0 {
            nums[i] = n + 1
        }
    }
    for i in 0..<n {
        let num = abs(nums[i])
        if num <= n {
            nums[num - 1] = -abs(nums[num - 1])
        }
    }
    for i in 0..<n {
        if nums[i] > 0 {
            return i + 1
        }
    }
    return n + 1
}

print(firstMissingPositive([1,2,0]))
