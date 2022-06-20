// 内建集合类型-数组

import Foundation

// 斐波那契数列
let fibs = [0, 1, 1, 2, 3, 5]

var mutableFibs = [0, 1, 1, 2, 3, 5]
mutableFibs.append(8)
mutableFibs.append(contentsOf: [13, 21])
mutableFibs

// 数组变形
// MARK: - Map

var squared: [Int] = []
for fib in fibs {
    squared.append(fib * fib)
}

squared // [0, 1, 1, 4, 9, 25]

let squares = fibs.map {fib in fib * fib}
squares // [0, 1, 1, 4, 9, 25]


let names = ["Paula", "Elena", "Zero"]
var lastNameEndingInA: String?
for name in names.reversed() where name.hasSuffix("a") {
    lastNameEndingInA = name
    break
}
lastNameEndingInA // "Elena"

extension Sequence {
    func last(where predicate: (Element) -> Bool) -> Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}

let match = names.last { $0.hasSuffix("a") }
match// "Elena"

extension Array {
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}

[1, 2, 3, 4].accumulate(0, +) // [1, 3, 6, 10]

// MARK: - Filter

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let resultNums = nums.filter { num in num % 2 == 0 }
resultNums // [2, 4, 6, 8, 10]

// 寻找 100 以内同时满足是偶数并且是其他数字的平方的数
(1 ..< 10).map { $0 * $0 }.filter{ $0 % 2 == 0 } // [4, 16, 36, 64]
 
extension Sequence {
    public func all(matching predicate: (Element) -> Bool) -> Bool {
        // 对于一个条件，如果没有元素不满足它的话，那意味着所有元素都满足它：
        return !contains{!predicate($0)}
    }
}

resultNums.all {$0 % 2 == 0} // ture

// MARK: - Reduce

var total = 0
for num in fibs {
     total = total + num
}
total  // 12
let sum = fibs.reduce(0) { total, num in total + num}
sum // 12

fibs.reduce(0, +)

fibs.reduce("") {str, num in str + "\(num), "}

// 使用 reduce 实现 map 和 filter
extension Array {
    func map2<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([]) {
            $0 + [transform($1)]
        }
    }
    
    func filter2(_ isIncluded: (Element) -> Bool) -> [Element] {
        return reduce([]) {
            isIncluded($1) ? $0 + [$1] : $0
        }
    }
}

// 高效方式重写 filter
extension Array {
    func filter3(_ isIncluded: (Element) -> Bool) -> [Element] {
        return reduce(into: []) { result, element in
            if isIncluded(element) {
                result.append(element)
            }
        }
    }
}

// MARK: - flatMap
let suits = ["♠︎", "♥︎", "♣︎", "♦︎"]
let ranks = ["J","Q","K","A"]
let result = suits.flatMap { suit in
    ranks.map { rank in
        (suit, rank)
    }
}

// MARK: - 数组类型
// MARK: - 切片

let slice = fibs[1...]
slice // [1, 1, 2, 3, 5]
type(of: slice) // ArraySlice<Int>.T
// 将切片转换为数组
let newArray = Array(slice)
type(of: newArray) // Array<Int>.Type
