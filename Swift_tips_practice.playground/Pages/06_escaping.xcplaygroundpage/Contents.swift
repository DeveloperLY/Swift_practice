// @escaping

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Swift 中我们可以定义一个接受函数作为参数的函数，而在调用时，使用闭包的方式来传递这个参数是常见手段：

func doWork(block: ()->()) {
    block()
}

doWork {
    print("work")
}

/**
 这种最简单的形式的闭包其实还默认隐藏了一个假设，那就是参数中 block 的内容会在 doWork 返回前就完成。也就是说，对于 block 的调用是同步行为。
 */

// 添加 @escaping 标记表明这个闭包是会“逃逸”出该方法的：

func doWorkAsync(block: @escaping ()->()) {
    DispatchQueue.main.async {
        block()
    }
}

// 接受 @escaping 的 doWorkAsync 则有所不同。由于需要确保闭包内的成员依然有效，如果在闭包内引用了 self 及其成员的话，Swift 将强制我们明确地写出 self

class S {
    var foo = "foo"
    
    func method1() {
        doWork {
            print(foo)
        }
        foo = "bar"
    }
    
    func method2() {
        doWorkAsync {
            print(self.foo)
        }
        foo = "bar"
    }
    
    func method3() {
        doWorkAsync {
            [weak self] in
            print(self?.foo ?? "nil") // 在闭包执行时已经没有对于实例的引用，因此 self?.foo == nil
        }
        foo = "bar"
    }
    
    // 如果不希望在闭包中持有 self, 可以使用 [weak self]
}

S().method1() // foo
S().method2() // bar

S().method3() // nil


/**
 关于 @escaping 最后还有一点想要说明。如果你在协议或者父类中定义了一个接受 @escaping 为参数方法，那么在实现协议和类型或者是这个父类的子类中，对应的方法也必须被声明为 @escaping，否则两个方法会被认为拥有不同的函数签名：
 */

protocol P {
    func work(b: @escaping ()->())
}

class C: P {
    func work(b: @escaping () -> ()) {
        DispatchQueue.main.async {
            print("in C")
            b()
        }
    }
}

C().work {
    print("work!")
}

// in C
// work!
