// indirect 和嵌套 enum

import Foundation

// 在涉及到一些数据结构的经典理论和模型 (没错，就是链表，树和图) 时，我们往往会用到嵌套的类型。
// 比如链表，在 Swift 中，我们可以这样来定义一个单向链表：

//class Node<T> {
//    let value: T?
//    let next: Node<T>?
//
//    init(value: T?, next: Node<T>?) {
//        self.value = value
//        self.next = next
//    }
//}
//
//let list = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil))))

// 单向链表： 1 -> 2 -> 3 ->4

// 在 enum 的定义中嵌套自身对于 class 这样的引用类型来说没有任何问题，
// 但是对于像 struct 或者 enum 这样的值类型来说，普通的做法是不可行的。
// 我们需要在定义前面加上 indirect 来提示编译器不要直接在值类型中直接嵌套。

indirect enum LinkedList<Element: Comparable> {
    case empty
    case node(Element, LinkedList<Element>)
    
    func removing(_ element: Element) -> LinkedList<Element> {
        guard case let .node(value, next) = self else {
            return .empty
        }
        return value == element ?
            next : LinkedList.node(value, next.removing(element))
    }
}

let linkedList = LinkedList.node(1, .node(2, .node(3, .node(4, .empty))))
print(linkedList)

let result1 = linkedList.removing(2)
print(result1)

let result2 = linkedList.removing(100)
print(result2)

let emptyList = LinkedList<Int>.empty
let result3 = emptyList.removing(12)
print(result3)
