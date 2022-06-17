// 判等、哈希

import Foundation

let str1 = "快乐的字符串"
let str2 = "快乐的字符串"
let str3 = "开心的字符串"

str1 == str2  // true
str1 == str3  // false

class TodoItem {
    let uuid: String
    var title: String

    init(uuid: String, title: String) {
        self.uuid = uuid
        self.title = title
    }
}

extension TodoItem: Equatable {

}

func ==(lhs: TodoItem, rhs: TodoItem) -> Bool {
    return lhs.uuid == rhs.uuid
}

let item1 = TodoItem(uuid: "UUID", title: "学习")
let item2 = TodoItem(uuid: "UUID", title: "听歌")
let item3 = TodoItem(uuid: "UUID-TingGe", title: "听歌")

item1 == item2  // true
item1 == item3  // false


// hash

let num = 10
print(num.hashValue)
