/*
 1738. 找出第 K 大的异或坐标值

 给你一个二维矩阵 matrix 和一个整数 k ，矩阵大小为 m x n 由非负整数组成。

 矩阵中坐标 (a, b) 的 值 可由对所有满足 0 <= i <= a < m 且 0 <= j <= b < n 的元素 matrix[i][j]（下标从 0 开始计数）执行异或运算得到。

 请你找出 matrix 的所有坐标中第 k 大的值（k 的值从 1 开始计数）。

  

 示例 1：
 输入：matrix = [[5,2],[1,6]], k = 1
 输出：7
 解释：坐标 (0,1) 的值是 5 XOR 2 = 7 ，为最大的值。
 
 
 示例 2：
 输入：matrix = [[5,2],[1,6]], k = 2
 输出：5
 解释：坐标 (0,0) 的值是 5 = 5 ，为第 2 大的值。
 
 
 示例 3：
 输入：matrix = [[5,2],[1,6]], k = 3
 输出：4
 解释：坐标 (1,0) 的值是 5 XOR 1 = 4 ，为第 3 大的值。
 
 
 示例 4：
 输入：matrix = [[5,2],[1,6]], k = 4
 输出：0
 解释：坐标 (1,1) 的值是 5 XOR 2 XOR 1 XOR 6 = 0 ，为第 4 大的值。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-kth-largest-xor-coordinate-value
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func kthLargestValue(_ matrix: [[Int]], _ k: Int) -> Int {
    let m = matrix.count, n = matrix[0].count
    var pre = Array.init(repeating: Array.init(repeating: 0, count: n + 1), count: m + 1)
    var results = [Int]()
    for i in 1...m {
        for j in 1...n {
            pre[i][j] = pre[i - 1][j] ^ pre[i][j - 1] ^ pre[i - 1][j - 1] ^ matrix[i - 1][j - 1]
            results.append(pre[i][j])
        }
    }
    nthElement(&results, 0, k - 1, results.count - 1)
    return results[k - 1]
}

func nthElement(_ results: inout [Int], _ left: Int, _ kth: Int, _ right: Int) {
    if left == right { return }
    let pivot = Int.random(in: left...right)
    swap(&results, pivot, right)
    var sepl = left - 1, sepr = left - 1
    for i in left...right {
        if results[i] > results[right] {
            sepr += 1
            sepl += 1
            swap(&results, sepr, i)
            swap(&results, sepl, sepr)
        } else if results[i] == results[right] {
            sepr += 1
            swap(&results, sepr, i)
        }
    }
    if sepl < left + kth && left + kth <= sepr {
        return
    } else if left + kth <= sepl {
        nthElement(&results, left, kth, sepl)
    } else {
        nthElement(&results, sepr + 1, kth - (sepr - left + 1), right)
    }
}

func swap(_ results: inout [Int], _ index1: Int, _ index2: Int) {
    let temp = results[index1]
    results[index1] = results[index2]
    results[index2] = temp
}

print(kthLargestValue([[5,2],[1,6]], 1))
