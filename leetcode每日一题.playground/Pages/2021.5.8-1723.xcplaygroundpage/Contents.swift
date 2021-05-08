/*
 1723. 完成所有工作的最短时间
 
 给你一个整数数组 jobs ，其中 jobs[i] 是完成第 i 项工作要花费的时间。

 请你将这些工作分配给 k 位工人。所有工作都应该分配给工人，且每项工作只能分配给一位工人。工人的 工作时间 是完成分配给他们的所有工作花费时间的总和。请你设计一套最佳的工作分配方案，使工人的 最大工作时间 得以 最小化 。

 返回分配方案中尽可能 最小 的 最大工作时间 。

  

 示例 1：
 输入：jobs = [3,2,3], k = 3
 输出：3
 解释：给每位工人分配一项工作，最大工作时间是 3 。
 
 
 示例 2：
 输入：jobs = [1,2,4,7,8], k = 2
 输出：11
 解释：按下述方式分配工作：
 1 号工人：1、2、8（工作时间 = 1 + 2 + 8 = 11）
 2 号工人：4、7（工作时间 = 4 + 7 = 11）
 最大工作时间是 11 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-minimum-time-to-finish-all-jobs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
    let num = jobs.count
    // 将工作按时间从大到小排序
    let jobArr = jobs.sorted(by: >)
    // 回溯函数
    // i为正在分配的任务编号，arr为每个工人的目前工作时间，mid为最大工作时间
    func helper(_ i: Int, _ arr: inout [Int], _ mid: Int) -> Bool {
        // 如果i==len，说明已经将所有工作安排完了
        // 这表明当工作时间为mid时，能够分配所有工作，所以直接返回true
        if i == num { return true }
        let job = jobArr[i]
        // 尝试给每个工人分配当前的工作
        for j in 0..<k {
            // 只有目前工作时间加上当前工作所需时间不超过最大工作时间的工人才能被分配当前任务
            if (arr[j] + job <= mid) {
                arr[j] += job
                // 分配完后，继续分配下一个任务
                if helper(i + 1, &arr, mid) { return true }
                // 将该工人的目前工作时间复原
                arr[j] -= job
            }
            // 剪枝
            // 如果当前工人的目前工作时间为0，则后面的工人的目前工作时间也为0，将当前工作分配给他们和分配给当前工人的情况其实是一样的。
            // 如果给当前工人分配当前工作，其工作时间刚好与最大工作时间相等，则说明对当前工人已经是最佳的分配方式，无需再尝试将当前任务分给其它工人。
            if arr[j] == 0 || arr[j] + job == mid { break }
        }
        // 给所有工人分配当前任务都没有找到存在的安排方式，说明无法全部安排，直接返回false
        return false
    }
    // 确认函数
    func check(_ mid: Int) -> Bool {
        // 创建arr数组，arr[i]表示第i位工人目前的工作时间
        var arr = Array.init(repeating:0, count: k)
        // 从jobs[0]开始分配，确认当工作时间为mid时，能否成功分配所有工作
        return helper(0, &arr, mid)
    }
    // 二分查找
    // 左边界设为单个工作的时间最大值，右边界设为所有工作的时间和
    // 左边界为假设有无数工人所需的最大工作时间，右边界为只有一个工人所需的最大工作时间
    var left = jobArr[0], right = jobArr.reduce(0) { x, y in x + y }
    while left < right {
        let mid = (left + right) >> 1
        // 确认当工作时间为mid时，能否成功分配所有工作，再根据结果调整左右边界
        if check(mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}

print(minimumTimeRequired([3,2,3], 3))
