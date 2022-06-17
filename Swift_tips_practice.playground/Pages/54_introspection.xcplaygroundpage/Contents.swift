// 自省
import Foundation

class ClassA: NSObject { }
class ClassB: ClassA { }

let obj1: NSObject = ClassB()
let obj2: NSObject = ClassB()

// isKind: 判断 obj1 是否是 ClassA 或者其子类的实例对象；
obj1.isKind(of: ClassA.self)    // true
// isMemberOfClass: 则对 obj2 做出判断，当且仅当 obj2 的类型为 ClassB 时返回为真
obj2.isMember(of: ClassA.self)  // false

let obj: AnyObject = ClassB()

if (obj is ClassA) {
    print("属于 ClassA")
}

if (obj is ClassB) {
    print("属于 ClassB")
}

