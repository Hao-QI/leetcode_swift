/*
 37. 解数独
 
 编写一个程序，通过填充空格来解决数独问题。

 数独的解法需 遵循如下规则：

 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）
 数独部分空格内已填入了数字，空白格用 '.' 表示。

  

 示例：
 #imageLiteral(resourceName: "37-图片1.png")
 输入：board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
 输出：[["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
 解释：输入的数独如上图所示，唯一有效的解决方案如下所示：
 #imageLiteral(resourceName: "37-图片2.png")
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sudoku-solver
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

var rows: [[Bool]] = []                 // 行
var columns: [[Bool]] = []              // 列
var squares: [[[Bool]]] = []            // 3x3宫格
var spaces: [(x: Int, y: Int)] = []     // 需要填充的空白格

func solveSudoku(_ board: inout [[Character]]) {
    rows = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    columns = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    squares = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 3), count: 3)
    for i in 0..<9 {
        for j in 0..<9 {
            if board[i][j] == "." {
                spaces.append((i, j))
            } else {
                let digit = Int(board[i][j].asciiValue! - 49)
                rows[i][digit] = true
                columns[j][digit] = true
                squares[i/3][j/3][digit] = true
            }
        }
    }

    backtrack(0, &board)
}

func backtrack(_ pos: Int, _ board: inout [[Character]]) -> Bool {
    guard pos < spaces.count else {
        return true
    }

    let (x, y) = spaces[pos]
    for digit in 0..<9 {
        let squareX = x / 3
        let squareY = y / 3
        if rows[x][digit] || columns[y][digit] || squares[squareX][squareY][digit] {
            continue
        }

        rows[x][digit] = true
        columns[y][digit] = true
        squares[squareX][squareY][digit] = true
        board[x][y] = Character(String(digit + 1))
        if backtrack(pos + 1, &board) {
            return true
        }
        board[x][y] = "."
        rows[x][digit] = false
        columns[y][digit] = false
        squares[squareX][squareY][digit] = false
    }
    
    return false
}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
solveSudoku(&board)
print(board)
