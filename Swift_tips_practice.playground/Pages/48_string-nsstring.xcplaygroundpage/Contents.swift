// String 还是 NSString

import Foundation

let levels = "ABCDE"
for i in levels {
    print(i)
}

// 输出：
// ABCDE
if (levels as NSString).contains("BC") {
    print("包含字符串")
}

levels.contains("")


// 输出：
// 包含字符串


let nsRange = NSMakeRange(1, 4)
// 编译错误
// Instance method 'replacingCharacters(in:with:)' requires that 'NSRange' (aka '_NSRange') conform to 'RangeExpression'
//levels.replacingCharacters(in: nsRange, with: "AAAA")

let indexPositionOne = levels.index(levels.startIndex, offsetBy: 1)
let swiftRange = indexPositionOne ..< levels.index(levels.startIndex, offsetBy: 5)
levels.replacingCharacters(in: swiftRange, with: "AAAA")
// 输出：
// AAAAA

(levels as NSString).replacingCharacters(in: nsRange, with: "AAAA")
