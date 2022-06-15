// 可变参数函数

import Foundation

func sum(input: Int...) -> Int {
    return input.reduce(0, +)
}

print(sum(input: 1, 2, 3, 4, 5)) // 15

// 相较于其它语言可变参数只能作为最后一个参数使用， Swift 则没有这个限制，因为可以对方法参数命名

func myFunc(numbers: Int..., string: String) {
    numbers.forEach {
        for i in 0..<$0 {
            print("\(i + 1): \(string)")
        }
    }
}

myFunc(numbers: 1, 2, 3, string: "Swifter")
