// Selector

import Foundation

class MyObject: NSObject {
    @objc func callMe() {
        print("callMe...")
    }

    @objc func callMeWithParam(obj: AnyObject!) {
        print("callMeWithParam")
    }
    
    @objc func turn(by angle: Int, speed: Float) {
        // TODO:
    }
    
    func selectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam(obj:))
        let method = #selector(turn(by:speed:))

        return [someMethod, anotherMethod, method]
    }
    
    func otherSelectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam)
        let method = #selector(turn)
        
        return [someMethod, anotherMethod, method]
    }
    
    // 如果在同一个作用域中存在同样名字的两个方法，即使它们的函数签名不相同，Swift 编译器也不允许编译通过：
    @objc func commonFunc() {
        print("commonFunc...")
    }
    
    @objc func commonFunc(input: Int) -> Int {
        print("commonFunc...\(input)")
        return input
    }
    
    func sameNameSelectors() -> [Selector] {
        // let method = #selector(commonFunc) // 编译错误
        // 需要强制转换
        let method1 = #selector(commonFunc as ()->())
        let method2 = #selector(commonFunc as (Int)->Int)
        return [method1, method2]
    }
}

let selectors = MyObject().selectors()
print(selectors)

let otherSelectors = MyObject().otherSelectors()
print(otherSelectors)

let sameNameSelectors = MyObject().sameNameSelectors()
print(sameNameSelectors)

