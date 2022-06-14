// 字面量表达

import Foundation
 
let aNmuber = 3
let aString = "Swifter"
let aBool = true

// 3、Swifter、true 称为字面量

// Array 和 Dictionary 在使用简单的描述赋值时，使用的也是字面量
let anArray = [1, 2, 3]
let aDictionary = ["key": "value"]

// 自己实现一个字面量表达式
enum MyBool: Int {
    case myTrue, myFalse
}

extension MyBool: ExpressibleByBooleanLiteral {
    init(booleanLiteral aValue: Bool) {
        self = aValue ? .myTrue : .myFalse
    }
}

let myTrue: MyBool = true
let myFalse: MyBool = false

myTrue.rawValue    // 0
myFalse.rawValue   // 1


// 深入一些的案例
/**
 class Person {
     let name: String
     init(name value: String) {
         self.name = value
     }
 }
 */

// 如果希望通过 name 赋值来生成 Person 对象, 改造
class Person: ExpressibleByStringLiteral {
    
    let name: String
    
    init(name value: String) {
        self.name = value
    }
    
    required convenience init(stringLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(unicodeScalarLiteral value: String) {
        self.init(name: value)
    }
}

let p: Person = "Swifter"
print(p.name) // 输出：Swifter

// 不能使用Extension 是因为在 extension 中，我们是不能定义 required 的初始化方法的。也就是说，我们无法为现有的非 final 的 class 添加字面量表达
