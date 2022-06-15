// final
// final 关键字可以用在 class，func 或者 var 前面进行修饰，
// 表示不允许对该内容进行继承或者重写操作。

import Foundation

class Parent {
    final func method() {
        print("开始配置")
        // ..必要的代码
        
        methodImpl()
        
        // ..必要的代码
        print("结束配置")
    }
    
    func methodImpl() {
        fatalError("子类必须实现这个方法")
        // 或者也可以给出默认实现
    }
    
}

class Child: Parent {
    override func methodImpl() {
        //..子类的业务逻辑
        print("Setup in Child")
    }
}

let c = Child()
c.method()
