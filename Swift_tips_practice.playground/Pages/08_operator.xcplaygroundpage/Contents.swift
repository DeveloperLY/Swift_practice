// operator

import Foundation

// 与 Objective-C 不同，Swift 支持重载操作符这样的特性，最常见的使用方式可能就是定义一些简便的计算了。

// 二维向量的数据结构
struct Vector2D {
    var x = 0.0
    var y = 0.0
}

// 需求：两个 Vector2D 相加
let v1 = Vector2D(x: 3, y: 4)
let v2 = Vector2D(x: 5, y: 6)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
// v3 为 {x 8.0, y 10.0}

// 一次的话似乎还好，很多次这种操作，重载加号操作符
func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let v4 = v1 + v2 // {x 8.0, y 10.0}

// 新增运算符
// 点积运算

// 果我们要新加操作符的话，需要先对其进行声明，告诉编译器这个符号其实是一个操作符
// 完整列表： https://github.com/apple/swift-evolution/blob/master/proposals/0077-operator-precedence.md

// 定义操作符的优先级组
precedencegroup DotProductPrecedence {
    associativity: none // 结合律
    higherThan: MultiplicationPrecedence // 优先于乘法
}

// 中位操作符 即前后都是输入；其他的修饰子还包括 prefix 和 postfix
infix operator +*: DotProductPrecedence

func +* (left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}

let result = v1 +* v2 // 输出为 39.0

// 注意：Swift 的操作符是不能定义在局部域中的，因为至少会希望在能在全局范围使用你的操作符，否则操作符也就失去意义了
// 另外，来自不同 module 的操作符是有可能冲突的，这对于库开发者来说是需要特别注意的地方
