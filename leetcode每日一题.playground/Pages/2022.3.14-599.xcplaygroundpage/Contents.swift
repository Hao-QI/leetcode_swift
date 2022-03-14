/*
 599. 两个列表的最小索引总和
 
 假设 Andy 和 Doris 想在晚餐时选择一家餐厅，并且他们都有一个表示最喜爱餐厅的列表，每个餐厅的名字用字符串表示。

 你需要帮助他们用最少的索引和找出他们共同喜爱的餐厅。 如果答案不止一个，则输出所有答案并且不考虑顺序。 你可以假设答案总是存在。

  

 示例 1:
 输入: list1 = ["Shogun", "Tapioca Express", "Burger King", "KFC"]，list2 = ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
 输出: ["Shogun"]
 解释: 他们唯一共同喜爱的餐厅是“Shogun”。
 
 
 示例 2:
 输入:list1 = ["Shogun", "Tapioca Express", "Burger King", "KFC"]，list2 = ["KFC", "Shogun", "Burger King"]
 输出: ["Shogun"]
 解释: 他们共同喜爱且具有最小索引和的餐厅是“Shogun”，它有最小的索引和1(0+1)。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-index-sum-of-two-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var map = [String: Int]()
    for (index, value) in list1.enumerated() {
        map[value] = index
    }
    var result = [String]()
    var indexSum = Int.max
    for (index, value) in list2.enumerated() {
        if let index2 = map[value] {
            if index + index2 < indexSum {
                indexSum = index + index2
                result.removeAll()
                result.append(value)
            } else if index + index2 == indexSum {
                result.append(value)
            }
        }
    }
    return result
}

print(findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]))

