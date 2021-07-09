/*
 面试题 17.10. 主要元素
 
 数组中占比超过一半的元素称之为主要元素。给你一个 整数 数组，找出其中的主要元素。若没有，返回 -1 。请设计时间复杂度为 O(N) 、空间复杂度为 O(1) 的解决方案。

  

 示例 1：
 输入：[1,2,5,9,5,9,5,5,5]
 输出：5
 
 
 示例 2：
 输入：[3,2]
 输出：-1
 
 
 示例 3：
 输入：[2,2,1,1,1,2,2]
 输出：2

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-majority-element-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func majorityElement(_ nums: [Int]) -> Int {
    var candidate = -1
    var count = 0
    for num in nums {
        if count == 0 { candidate = num }
        if num == candidate {
            count += 1
        } else {
            count -= 1
        }
    }
    count = 0
    let length = nums.count
    for num in nums {
        if num == candidate {
            count += 1
        }
    }
    return count * 2 > length ? candidate : -1
}

print(majorityElement([1,2,5,9,5,9,5,5,5]))
