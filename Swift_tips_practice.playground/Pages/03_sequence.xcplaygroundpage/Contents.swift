//
//  03_sequence.swift
//  Swift_tips_practice
//
//  Created by LiuY on 2022/6/13.
//
//

import UIKit

/**
 Swift 的 for...in 可以用在所有实现了 Sequence 的类型上，而为了实现 Sequence 你首先需要实现一个 IteratorProtocol。
 */

// 实现反向的 iterator 和 sequence

// 先定义一个实现了 IteratorProtocol 协议的类型
// IteratorProtocol 需要指定一个 typealias Element
// 以及提供一个返回 Element? 的方法 next()

class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

// 然后定义 Sequence
// 和 IteratorProtocol 很类似，不过换成指定一个 typealias Iterator
// 以及提供一个返回 Iterator? 的方法 makeIterator()

struct ReverseSequence<T>: Sequence {
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}

// eg:
func sequenceTestDemo() {
    let arr = [0, 1, 2, 3, 4, 5]

    // 对 Sequence 可以使用 for...in 来循环访问
    for i in ReverseSequence(array: arr) {
        print("Index\(i) is \(arr[i])")
    }
    
    /**
     Index 5 is 5
     Index 4 is 4
     Index 3 is 3
     Index 2 is 2
     Index 1 is 1
     Index 0 is 0
     */
    
    // 探究 for...in
    // 将其展开大概是这样
    var iterator = arr.makeIterator()
    while let obj = iterator.next() {
        print(obj)
    }
}

