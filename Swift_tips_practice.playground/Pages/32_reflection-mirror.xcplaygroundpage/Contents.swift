// Reflection 和 Mirror

import Foundation

struct Person {
    let name: String
    let age: Int
}

let zero = Person(name: "Zero", age: 18)
let r = Mirror(reflecting: zero) // r 是 MirrorType

print("zero 是 \(r.displayStyle!)")
print("属性个数: \(r.children.count)")

// 通过 Mirror 初始化得到的结果中包含的元素的描述都被集合在 children 属性下
for child in r.children {
    print("属性名: \(String(describing: child.label)), 值: \(child.value)")
}

// 输出：
// zero 是 struct
// 属性个数: 2
// 属性名: Optional("name"), 值: Zero
// 属性名: Optional("age"), 值: 18

func valueFrom(_ object: Any, key: String) -> Any? {
    let mirror = Mirror(reflecting: object)
    
    for child in mirror.children {
        let (targetKey, targetMirror) = (child.label, child.value)
        if key == targetKey {
            return targetMirror
        }
    }
    return nil
}

// 接上面的 zero
if let name = valueFrom(zero, key: "name") as? String {
    print("通过 key 得到值：\(name)")
}

// 输出：通过 key 得到值：Zero
