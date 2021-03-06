// 多类型和容器

import UIKit

var greeting = "Hello, playground"

let numbers = [1,2,3,4,5]
// numbers 的类型是 [Int]

let strings = ["hello", "world"]
// strings 的类型是 [String]

// 这样转换会导致精度丢失，而且使用的时候也要转换，是一种最差的选择
// [Any] Any 类型可以隐式转换
let mixed1: [Any] = [1, "two", 3]

// [NSObject]
let objectArray = [1 as NSObject, "two" as NSObject, 3 as NSObject]

let any = mixed1[0]  // Any 类型
let nsObject = objectArray[0] // NSObject 类型

let mixed2: [CustomStringConvertible] = [1, "two", 3]

for obj in mixed2 {
    print(obj.description)
}

// 以上这种将数组声明为 [CustomStringConvertible] 的方法虽然也损失了一部分类型信息，
// 但是相对于 Any 或者 AnyObject
// 还是改善很多，在对于对象中存在某种共同特性的情况下无疑是最方便的。

// 利用 enum 可以带有值的特点，将类型信息封装到特定的 enum 中。
// 通过这种方法，我们完整地在编译时保留了不同类型的信息。
print("-------------------------")

enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}

let mixed3 = [IntOrString.IntValue(1), IntOrString.StringValue("two"), IntOrString.IntValue(3)]

for value in mixed3 {
    switch value {
    case let .IntValue(i):
        print(i * 2)
    case let .StringValue(s):
        print(s.capitalized)
    }
}

// 输出：
// 2
// Two
// 6

// 为了方便，我们甚至可以进一步为 IntOrString 使用字面量转换的方法编写简单的获取方式

print("-------------------------")

typealias ExpressibleByIntegerOrStringLiteral =  ExpressibleByIntegerLiteral & ExpressibleByStringLiteral

extension IntOrString: ExpressibleByIntegerOrStringLiteral {
    init(integerLiteral value: Int) {
        self = .IntValue(value)
    }
    
    init(stringLiteral value: String) {
        self = .StringValue(value)
    }
    
}

let mixed4 = [IntOrString(1), IntOrString("two"), IntOrString(3)]

for value in mixed4 {
    switch value {
    case let .IntValue(i):
        print(i * 2)
    case let .StringValue(s):
        print(s.capitalized)
    }
}
