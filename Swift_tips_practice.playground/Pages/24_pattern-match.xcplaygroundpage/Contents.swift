// 模式匹配
// 和正则表达式特性相似
// 从概念上来说正则匹配只是模式匹配的一个子集，
// 但是在 Swift 里现在的模式匹配还很初级，也很简单，只能支持最简单的相等匹配和范围匹配。
// 在 Swift 中，使用 ~= 来表示模式匹配的操作符。

import Foundation

// 判等的类型判断
let password = "adf@4(3"

switch password {
    case "adf@4(3":
        print("密码正确")
    default:
        print("密码错误")
}

// 对 Optional 的判断
let num: Int? = nil

switch num {
    case nil:
        print("没值")
    default:
        print("\(num!)")
}

// 对范围的判断
let x = 0.5

switch x {
    case -1.0...1.0:
        print("区间内")
    default:
        print("区间外")
}

// Swift 的 switch 就是使用了 ~= 操作符进行模式匹配的

// 重载 ~= 操作符，让其接受一个 NSRegularExpression 作为模式，去匹配输入的 String

func ~=(pattern: NSRegularExpression, input: String) -> Bool {
    return pattern.numberOfMatches(in: input, options: [], range: NSRange(location: 0, length: input.count)) > 0
}

// 为了简便， 添加一个字符串转换为 NSRegularExpression 的操作符
prefix operator ~/

prefix func ~/(pattern: String) throws -> NSRegularExpression {
    return try NSRegularExpression(pattern: pattern, options: [])
}

let contact = ("http://developerly.com", "coderyliu@gmail.com")

let mailRegex: NSRegularExpression
let siteRegex: NSRegularExpression

mailRegex = try ~/"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
siteRegex = try ~/"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

switch contact {
    case (siteRegex, mailRegex):
        print("同时拥有有效的网站和邮箱")
    case (_, mailRegex):
        print("只拥有有效的邮箱")
    case (siteRegex, _):
        print("只拥有有效的网站")
    default:
        print("都没有")
}

// 输出
// 同时拥有网站和邮箱
