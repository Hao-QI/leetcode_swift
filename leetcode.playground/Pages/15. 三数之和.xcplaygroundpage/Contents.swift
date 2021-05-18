/*
 15. 三数之和
 
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例 1：
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 
 
 示例 2：
 输入：nums = []
 输出：[]
 
 
 示例 3：
 输入：nums = [0]
 输出：[]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    let newNums = nums.sorted()
    var ans = [[Int]]()
    // 枚举 a
    for first in 0..<n {
        // 需要和上一次枚举的数不相同
        if first > 0 && newNums[first] == newNums[first - 1] { continue }
        // c 对应的指针初始指向数组的最右端
        var third = n - 1
        let target = -newNums[first]
        // 枚举 b
        for second in (first + 1)..<n {
            // 需要和上一次枚举的数不相同
            if second > first + 1 && newNums[second] == newNums[second - 1] { continue }
            // 需要保证 b 的指针在 c 的指针的左侧
            while second < third && newNums[second] + newNums[third] > target {
                third -= 1
            }
            // 如果指针重合，随着 b 后续的增加
            // 就不会有满足 a+b+c=0 并且 b<c 的 c 了，可以退出循环
            if (second == third) {
                break;
            }
            if newNums[second] + newNums[third] == target {
                ans.append([newNums[first], newNums[second], newNums[third]])
            }
        }
    }
    return ans
}

print(threeSum([-1,0,1,2,-1,-4]))
