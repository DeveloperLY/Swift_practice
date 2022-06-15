// Designated，Convenience 和 Required

import Foundation

// Swift 强化了 designated 初始化方法的地位。
// Swift 中不加修饰的 init 方法都需要在方法中保证所有非 Optional 的实例变量被赋值初始化，
// 而在子类中也强制 (显式或者隐式地) 调用 super 版本的 designated 初始化，
// 所以无论如何走何种路径，被初始化的对象总是可以完成完整的初始化的。

class ClassA {
    let numA: Int
    required init(num: Int) {
        numA = num
    }
    
    // convenience 修饰的初始化方法是不能被子类重写或者是从子类中以 super 的方式调用的
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000 : 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    
    required init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
}

let anObj = ClassB(bigNum: true)
// anObj.numA = 10000, anObj.numB = 10001

// 其实不仅仅是对 designated 初始化方法，
// 对于 convenience 的初始化方法，我们也可以加上 required 以确保子类对其进行实现。
// 这在要求子类不直接使用父类中的 convenience 初始化方法时会非常有帮助。
