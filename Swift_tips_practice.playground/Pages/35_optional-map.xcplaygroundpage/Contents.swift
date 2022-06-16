// Optional Map

import Foundation

// 经常会对 Array 类型使用 map 方法，
// 这个方法能对数组中的所有元素应用某个规则，然后返回一个新的数组。
let arr = [1, 2, 3]
let doubled = arr.map{
    $0 * 2
}

print(doubled)
// 输出：
// [2, 4, 6]

// 需求，要将某个 Int? 乘 2。
// 一个合理的策略是如果这个 Int? 有值的话，就取出值进行乘 2 的操作，
// 如果是 nil 的话就直接将 nil 赋给结果。

let num: Int? = 3

//var result: Int?
//if let realNum = num {
//    result = realNum * 2
//} else {
//    return nil
//}
//
//print("result = \(result)")

// 优雅简洁的方法使用 Optional 的 map

let result = num.map {
    $0 * 2
}

print("result = \(result)") // result = Optional(6)
