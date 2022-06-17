// 实例方法的动态调用

import Foundation

class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
    
    class func method(number: Int) -> Int {
        return number
    }
}

// 正常调用
let object = MyClass()
let result = object.method(number:2) // result = 3

// 这种方法只适用于实例
//let f = MyClass.method
//let result2 = f(object)(1) // result = 2


let f1 = MyClass.method // class func method 的版本

let f2: (Int) -> Int = MyClass.method // 和 f1 相同

let f3: (MyClass) -> (Int) -> Int = MyClass.method // func method 的柯里化版本

