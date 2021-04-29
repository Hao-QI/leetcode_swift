/*
 4. 寻找两个正序数组的中位数
 
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

  

 示例 1：
 输入：nums1 = [1,3], nums2 = [2]
 输出：2.00000
 解释：合并数组 = [1,2,3] ，中位数 2
 
 
 示例 2：
 输入：nums1 = [1,2], nums2 = [3,4]
 输出：2.50000
 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
 
 
 示例 3：
 输入：nums1 = [0,0], nums2 = [0,0]
 输出：0.00000
 
 
 示例 4：
 输入：nums1 = [], nums2 = [1]
 输出：1.00000
 
 
 示例 5：
 输入：nums1 = [2], nums2 = []
 输出：2.00000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let l1 = nums1.count, l2 = nums2.count
    let x = (l1 + l2)/2
    var arr = [Int]()
    if l1 == 0 { arr = nums2 }
    if l2 == 0 {
        if l1 == 0 { return 0 }
        arr = nums1
    }
    var a = 0
    var b = 0
    while arr.count < x + 1 {
        if a == nums1.count {
            arr.append(nums2[b])
            b += 1
            continue
        }
        if b == nums2.count {
            arr.append(nums1[a])
            a += 1
            continue
        }
        if nums1[a] <= nums2[b] {
            arr.append(nums1[a])
            a += 1
        } else {
            arr.append(nums2[b])
            b += 1
        }
    }
    if (l1 + l2) % 2 == 0 {
        return (Double(arr[x-1]) + Double(arr[x]))/2
    } else {
        return Double(arr[x])
    }
}

print(findMedianSortedArrays([1,2], [3]))
