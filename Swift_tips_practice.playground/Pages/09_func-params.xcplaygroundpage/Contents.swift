// func 的参数修饰

import Foundation

// 简单的 +1 器
func incrementor1(variable: Int) -> Int {
    return variable + 1
}

let a = incrementor1(variable: 5)

func incrementor2(variable: Int) -> Int {
//    variable += 1 // 错误代码 variable 修饰符是 let 是不可变的
    var num = variable
    num += 1
    return num
}

var luckyNumber = 8
let newNumber = incrementor2(variable: luckyNumber)
// newNumber = 9

print(luckyNumber)
// luckyNumber = 8

// 使用 inout 修饰 可以在函数内部修改输入的参数
func incrementor3(variable: inout Int) {
    variable += 1
}

luckyNumber = 8
incrementor3(variable: &luckyNumber)

print(luckyNumber)
// luckyNumber =9

// 对于值类型 inout 相当于在函数内部创建了一个新的值，然后在函数返回时将这个值赋给 & 修饰的变量，这与引用类型的行为是不同的。
// 要注意的是参数的修饰是具有传递限制的，就是说对于跨越层级的调用，我们需要保证同一参数的修饰是统一的。

//func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
//    func incrementor(variable: inout Int) -> () {
//        variable += addNumber;
//    }
//    return incrementor;
//}

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}

// 外层的 makeIncrementor 的返回里也需要在参数的类型前面明确指出修饰词，以符合内部的定义，否则将无法编译通过。

var input = 10
let incrementor = makeIncrementor(addNumber: 2)
incrementor(&input)
print(input)
