/*
 65. 有效数字
 
 有效数字（按顺序）可以分成以下几个部分：
 1. 一个 小数 或者 整数
 2. （可选）一个 'e' 或 'E' ，后面跟着一个 整数
 
 小数（按顺序）可以分成以下几个部分：
 1. （可选）一个符号字符（'+' 或 '-'）
 2. 下述格式之一：
    1. 至少一位数字，后面跟着一个点 '.'
    2. 至少一位数字，后面跟着一个点 '.' ，后面再跟着至少一位数字
    3. 一个点 '.' ，后面跟着至少一位数字
 
 整数（按顺序）可以分成以下几个部分：
 1. （可选）一个符号字符（'+' 或 '-'）
 2. 至少一位数字
 
 部分有效数字列举如下：
 ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"]
 
 部分无效数字列举如下：
 ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"]
 给你一个字符串 s ，如果 s 是一个 有效数字 ，请返回 true 。

  

 示例 1：
 输入：s = "0"
 输出：true
 
 
 示例 2：
 输入：s = "e"
 输出：false
 
 
 示例 3：
 输入：s = "."
 输出：false
 
 
 示例 4：
 输入：s = ".1"
 输出：true

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

enum State {
    case STATE_INITIAL
    case STATE_INT_SIGN
    case STATE_INTEGER
    case STATE_POINT
    case STATE_POINT_WITHOUT_INT
    case STATE_FRACTION
    case STATE_EXP
    case STATE_EXP_SIGN
    case STATE_EXP_NUMBER
    case STATE_END
    case STATE_ILLEGAL
}

enum CharType {
    case CHAR_NUMBER
    case CHAR_EXP
    case CHAR_POINT
    case CHAR_SIGN
    case CHAR_ILLEGAL
}

func toCharType(_ ch: Character) -> CharType {
    if ch >= "0" && ch <= "9" {
        return .CHAR_NUMBER
    } else if ch == "e" || ch == "E" {
        return .CHAR_EXP
    } else if ch == "." {
        return .CHAR_POINT
    } else if ch == "+" || ch == "-" {
        return .CHAR_SIGN
    } else {
        return .CHAR_ILLEGAL
    }
}

func transfer(_ st: State, _ typ: CharType) -> State {
    switch st {
    case .STATE_INITIAL:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_INTEGER
        case .CHAR_POINT:
            return .STATE_POINT_WITHOUT_INT
        case .CHAR_SIGN:
            return .STATE_INT_SIGN
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_INT_SIGN:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_INTEGER
        case .CHAR_POINT:
            return .STATE_POINT_WITHOUT_INT
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_INTEGER:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_INTEGER
        case .CHAR_EXP:
            return .STATE_EXP
        case .CHAR_POINT:
            return .STATE_POINT
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_POINT:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_FRACTION
        case .CHAR_EXP:
            return .STATE_EXP
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_POINT_WITHOUT_INT:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_FRACTION
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_FRACTION:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_FRACTION
        case .CHAR_EXP:
            return .STATE_EXP
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_EXP:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_EXP_NUMBER
        case .CHAR_SIGN:
            return .STATE_EXP_SIGN
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_EXP_SIGN:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_EXP_NUMBER
        default:
            return .STATE_ILLEGAL
        }
    case .STATE_EXP_NUMBER:
        switch typ {
        case .CHAR_NUMBER:
            return .STATE_EXP_NUMBER
        default:
            return .STATE_ILLEGAL
        }
    default:
        return .STATE_ILLEGAL
    }
}

func isNumber(_ s: String) -> Bool {
    var st: State = .STATE_INITIAL
    for ch in s {
        let typ = toCharType(ch)
        let nextState = transfer(st, typ)
        if nextState == .STATE_ILLEGAL { return false }
        st = nextState
    }
    return st == .STATE_INTEGER || st == .STATE_POINT || st == .STATE_FRACTION || st == .STATE_EXP_NUMBER || st == .STATE_END
}

print(isNumber("0"))
