/*
 34. 在排序数组中查找元素的第一个和最后一个位置

 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。

 进阶：

 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
  

 
 示例 1：
 输入：nums = [5,7,7,8,8,10], target = 8
 输出：[3,4]
 
 
 示例 2：
 输入：nums = [5,7,7,8,8,10], target = 6
 输出：[-1,-1]
 
 
 示例 3：
 输入：nums = [], target = 0
 输出：[-1,-1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func binarySearch(_ nums: [Int], _ target: Int, _ lower: Bool) -> Int {
    var left = 0, right = nums.count - 1, ans = nums.count
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] > target || (lower && nums[mid] >= target) {
            right = mid - 1
            ans = mid
        } else {
            left = mid + 1
        }
    }
    return ans
}

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let leftIdx = binarySearch(nums, target, true)
    let rightIdx = binarySearch(nums, target, false) - 1
    if leftIdx <= rightIdx && rightIdx < nums.count && nums[leftIdx] == target && nums[rightIdx] == target {
        return [leftIdx, rightIdx]
    }
    return [-1, -1]
}

print(searchRange([5,7,7,8,8,10], 8))
