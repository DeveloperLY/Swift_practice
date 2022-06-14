// @autoclosure 和 ??

import Foundation

// @autoclosure 做的事情就是把一句表达式自动封装成一个闭包（closure）。这样有时候在语法上看起来就会非常漂亮

// 方法接收一个闭包，当闭包执行的结果为 true 的时候进行打印：
func logIfTrue(_ predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

// 调用
logIfTrue({return 2 > 1})

// 省略 return
logIfTrue({2 > 1})

// 因为这个闭包是最后一个参，所以可以使用尾随闭包（trailing closure）的方式把大括号拿出来，然后省略括号
logIfTrue{2 > 1}

// 使用 @autoclosure
func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue(2 > 1)



var level: Int?
var startLevel = 1

var currentLevel = level ?? startLevel

/**
func ??<T>(optional: T?, defaultValue: @autoclosure () -> T?) -> T?

func ??<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T
 
func ??<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    switch optional {
        case .Some(let value):
            return value
        case .None:
            return defaultValue()
     }
}
 */

// @autoclosure 并不支持带有输入参数的写法，也就是说只有形如 () -> T 的参数才能使用这个特性进行简化

