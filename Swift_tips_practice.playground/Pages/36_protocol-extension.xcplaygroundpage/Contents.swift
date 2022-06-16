// Protocol Extension

import Foundation

protocol MyProtocol {
    func method()
}

extension MyProtocol {
    func method() {
        print("Called")
    }
}

// 在具体的实现这个协议的类型中，即使我们什么都不写，也可以编译通过。
// 进行调用的话，会直接使用 extension 中的实现：

//struct MyStruct: MyProtocol {
//    // protocol extension 为 protocol 中定义的方法提供了一个默认的实现。
//
//}

//MyStruct().method() // Called

struct MyStruct: MyProtocol {
    func method() {
        print("Called in struct")
    }
}

MyStruct().method() // Called in struct



protocol A1 {
    func method1() -> String
}

struct B1: A1 {
    func method1() -> String {
        return "hello"
    }
}

let b1 = B1()
b1.method1()

let a1: A1 = B1()
a1.method1()

protocol A2 {
    func method1() -> String
}

extension A2 {
    func method1() -> String {
        return "hi"
    }
    
    func method2() -> String {
        return "hi"
    }
}

struct B2: A2 {
    func method1() -> String {
        return "hello"
    }
    
    func method2() -> String {
        return "hello"
    }
}

let b2 = B2()

b2.method1()
b2.method2()

let a2 = b2 as A2

a2.method1()


a2.method2()
