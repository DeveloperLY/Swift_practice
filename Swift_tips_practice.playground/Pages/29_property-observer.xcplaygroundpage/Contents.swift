// 属性观察
// 属性观察 (Property Observers) 是 Swift 中一个很特殊的特性，
// 利用属性观察我们可以在当前类型内监视对于属性的设定，并作出一些响应。

import Foundation

// 在属性声明的时候添加相应的代码块，就可以对将要设定的值和已经设置的值进行监听了
// “属性观察的一个重要用处是作为设置值的验证

class MyClass {
    let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
    
    var date: NSDate {
        willSet {
            let d = date
            print("即将将日期从 \(d) 设定至 \(newValue)")
        }
        
        didSet {
            if (date.timeIntervalSinceNow > oneYearInSecond) {
                print("设定的时间太晚了！")
                date = NSDate().addingTimeInterval(oneYearInSecond)
            }
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }
    
    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.addingTimeInterval(10086)

// 输出
//即将将日期从 2022-06-15 10:03:56 +0000 设定至 2022-06-15 12:52:02 +0000
//已经将日期从 2022-06-15 10:03:56 +0000 设定至 2022-06-15 12:52:02 +0000

// 365 * 24 * 60 * 60 = 31_536_000
foo.date = foo.date.addingTimeInterval(100_000_000)

// 输出
// 即将将日期从 2022-06-15 12:52:02 +0000 设定至 2025-08-15 22:38:42 +0000
// 设定的时间太晚了！
// 已经将日期从 2022-06-15 12:52:02 +0000 设定至 2023-06-15 10:03:56 +0000


class A {
    var number :Int {
        get {
            print("get")
            return 1
        }
        
        set {
            print("set")
        }
    }
}

class B: A {
    override var number: Int {
        willSet {
            print("willSet")
        }
        
        didSet {
            print("didSet")
        }
    }
}

let b = B()
b.number = 0

// 输出
// willSet
// set
// didSet
