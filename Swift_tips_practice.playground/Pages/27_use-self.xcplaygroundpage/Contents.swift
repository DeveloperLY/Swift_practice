// 协议和类方法中的 Self
// 假设要实现一个 Copyable
// 满足这个协议的类型需要返回一个和接受方法调用的实例相同的拷贝。

protocol Copyable {
    func copy() -> Self
}

// 实现一个 MyClass 满足这个协议

class MyClass: Copyable {
    var num = 1
    
    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    required init() {
        
    }
}

let object = MyClass()
object.num = 100

let newObject = object.copy()
object.num = 1

print(object.num)       // 1
print(newObject.num)    // 100
