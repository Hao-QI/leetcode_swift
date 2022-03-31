/*
 42. 接雨水
 
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

  

 示例 1：
 #imageLiteral(resourceName: "42-图片1.png")
 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
 
 
 示例 2：
 输入：height = [4,2,0,3,2,5]
 输出：9

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/trapping-rain-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func trap(_ height: [Int]) -> Int {
    var ans = 0
    var left = 0, right = height.count - 1
    var leftMax = 0, rightMax = 0
    while left < right {
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if height[left] < height[right] {
            ans += leftMax - height[left]
            left += 1
        } else {
            ans += rightMax - height[right]
            right -= 1
        }
    }
    return ans
}

print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
