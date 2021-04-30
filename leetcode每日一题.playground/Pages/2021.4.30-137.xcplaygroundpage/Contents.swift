/*
 137. 只出现一次的数字 II
 
 给你一个整数数组 nums ，除某个元素仅出现 一次 外，其余每个元素都恰出现 三次 。请你找出并返回那个只出现了一次的元素。

  

 示例 1：
 输入：nums = [2,2,3,2]
 输出：3
 
 
 示例 2：
 输入：nums = [0,1,0,1,0,1,99]
 输出：99

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/single-number-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func singleNumber(_ nums: [Int]) -> Int {
    var dict = [Int:Int]()
    for num in nums {
        dict[num] = (dict[num] ?? 0) + 1
    }
    for (key,value) in dict {
        if value == 1 { return key }
    }
    return -1
}

print(singleNumber([2,2,3,2]))
