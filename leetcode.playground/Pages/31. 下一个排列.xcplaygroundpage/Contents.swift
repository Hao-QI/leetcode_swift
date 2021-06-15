/*
 31. 下一个排列
 
 实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

 必须 原地 修改，只允许使用额外常数空间。

  

 示例 1：
 输入：nums = [1,2,3]
 输出：[1,3,2]
 
 
 示例 2：
 输入：nums = [3,2,1]
 输出：[1,2,3]
 
 
 示例 3：
 输入：nums = [1,1,5]
 输出：[1,5,1]
 
 
 示例 4：
 输入：nums = [1]
 输出：[1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/next-permutation
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func nextPermutation(_ nums: inout [Int]) {
    var i = nums.count - 2
    while i >= 0 && nums[i] >= nums[i + 1] {
        i -= 1
    }
    if i >= 0 {
        var j = nums.count - 1
        while j >= 0 && nums[i] >= nums[j] {
            j -= 1
        }
        nums.swapAt(i, j)
    }
    nums[i + 1..<nums.count].reverse()
}

var nums = [1,2,3]
nextPermutation(&nums)
print(nums)
