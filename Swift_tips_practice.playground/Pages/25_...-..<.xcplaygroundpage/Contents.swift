// ... 和 ..<

import Foundation

for i in 0...3 {
    print(i, terminator: "")
}

// 输出 0123

// 确定字符串是不是全部小写

let test = "helLo"

let interval = "a"..."z"

print()

for c in test {
    if !interval.contains(String(c)) {
        print("\(c) 不是小写字母")
    }
}
// 输出 L 不是小写字母

// 在日常开发中，我们可能会需要确定某个字符是不是有效的 ASCII 字符，
// 和上面的例子很相似，我们可以使用 \0...~
// 这样的 ClosedInterval 来进行 (\0 和 ~ 分别是 ASCII 的第一个和最后一个字符)。
