// 下标

import Foundation

var arr = [1,2,3]
arr[2]            // 3
arr[2] = 8        // arr = [1,2,8]

var dic = ["cat" : "meow", "goat" : "mie"]
dic["cat"]          // {Some "meow"}
dic["cat"] = "miao" // dic = ["cat" : "miao", "goat" : "mie"]

// Swift 是允许我们自定义下标的。这不仅包含了对自己写的类型进行下标自定义，也包括了对那些已经支持下标访问的类型 (没错就是 Array 和 Dictionay) 进行扩展。
// Array 扩展下标，支持接收数组作为下标
extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

arr = [1, 2, 3, 4, 5]
arr[[0, 2, 3]]            // [1, 3, 4]
arr[[0, 2, 3]] = [-1, -3, -4]
arr                     // [-1, 2, -3, -4, 5]
