// COpaguePointer 和 Cconvention

import Foundation

int cFunction(int (callback)(int x, int y)) {
    return callback(1, 2);
}

// 这个函数接受一个 callback，这个 callback 有两个 int 类型的参数，cFunction 本身返回这个 callback 的结果。

let callback: @convention(c) (Int32, Int32) -> Int32 = {
    (x, y) -> Int32 in
    return x + y
}

//let result = cFunction(callback)
//print(result)
// 输出：
// 3

// 省略标注
let result = cFunction {
    (x, y) -> Int32 in
    return x + y
}
print(result)
// 输出：
// 3
