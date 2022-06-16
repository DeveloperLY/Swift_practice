// where 和模式匹配

import Foundation
 
let name = ["张三", "李四", "王五", "王二麻子"]

name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x)是小王吧")
    default:
        print("你好，\($0)")
    }
}

// 输出：
// 你好，张三
// 你好，李四
// 王五是小王吧
// 王二麻子是小王吧

let num: [Int?] = [59, 88, nil]

let n = num.flatMap {$0}
for score in n where score > 60 {
    print("及格啦 - \(score)")
}
// 输出：
// 及格啦 - 88

num.forEach {
    if let score = $0, score > 60 {
        print("及格啦 - \(score)")
    } else {
        print(":(")
    }
}
// 输出：
// :(
// 及格啦 - 88
// :(

let sortableArray: [Int] = [3, 1, 2, 4, 5]
let unsortableArray: [Any?] = ["Hello", 4, nil]

sortableArray.sorted()

//unsortableArray.sorted()
// 无法编译
// note: expected an argument list of type
// '(Self.Iterator.Element, Self.Iterator.Element) -> Bool'
// 这意味着 Swift 尝试使用带有闭包的 `sorted` 方法，并期望你输入一种排序方式
