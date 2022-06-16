// 多重 Optional

import Foundation

var string: String? = "string"
var anotherString: String?? = string

var literalOptional: String?? = "string"

var aNil: String? = nil

var anotherNil: String?? = aNil
var literalNil: String?? = nil

if anotherNil != nil {
    // This will output.
    print("anotherNil")
}

if literalNil != nil {
    // This will not output.
    print("literalNil")
}

// 如果我们遇到了多重 Optional 的麻烦的时候， lldb可以使用 fr v -R 命令来打印出变量的未加工过时的信息
