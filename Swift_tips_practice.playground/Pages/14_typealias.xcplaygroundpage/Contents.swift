//: [Previous](@previous)
// typealias

import UIKit

// typealias 是用来为已经存在的类型重新定义名字的，通过命名，可以使代码变得更加清晰。

// 案例：在计算二维平面上的距离和位置的时候，我们一般使用 Double 来表示距离，用 CGPoint 来表示位置：

typealias Location = CGPoint
typealias Distance = Double

func distance(from location: Location, to anotherLocation: Location) -> Distance {
    let dx = Distance(location.x - anotherLocation.x)
    let dy = Distance(location.y - anotherLocation.y)
    return sqrt(dx * dx + dy * dy)
}

let origin: Location = Location(x: 0, y: 0)
let point: Location = Location(x: 1, y: 1)

let d: Distance = distance(from: origin, to: point)

// 在涉及到泛型时，情况就稍微不太一样。首先，typealias 是单一的，也就是说你必须指定将某个特定的类型通过 typealias 赋值为新名字，而不能将整个泛型类型进行重命名
// 不过在别名中也引入泛型，也是可以的
 
class Person<T> {}

//typealias Worker<T> = Person<T>

typealias WorkId = String
typealias Worker = Person<WorkId>

//class Person<T> {}

typealias WorkerGeneric<T> = Person<T>

let w1 = Worker()
let w2 = WorkerGeneric<WorkId>()

// 另一个场景：某个类型同时实现多个协议的组合时。我们可以使用 & 符号连接几个协议，然后给它们一个新的更符合上下文的名字，来增强代码可读性：

protocol Cat {}
protocol Dog {}

typealias Pat = Cat & Dog

//: [Next](@next)
