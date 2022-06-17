// 获取对象类型

import Foundation

let date = NSDate()

let name: AnyClass! = object_getClass(date)
print(name) // Optional(__NSTaggedDate)


let typeName = type(of: date)
print(typeName) // __NSTaggedDate

let string = "Helle"
let stringType = type(of: string)
print(stringType) // String
