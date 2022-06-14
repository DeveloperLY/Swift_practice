// Optional Chaining

import Foundation

// 使用 Optional Chaining 可以让我们摆脱很多不必要的判断和取值，但是在使用的时候需要小心陷阱。
// 因为 Optional Chaining 是随时都可能提前返回 nil 的，所以使用 Optional Chaining 所得到的东西其实都是 Optional 的。

// 比如有下面的一段代码：

class Toy {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

// 在实际使用中，我们想要知道小明的宠物的玩具的名字的时候，可以通过下面的 Optional Chaining 拿到：
let xiaoming = Child()
let toyName = xiaoming.pet?.toy?.name

/**
 注意虽然我们最后访问的是 name，并且在 Toy 的定义中 name 是被定义为一个确定的 String 而非 String? 的，但是我们拿到的 toyName 其实还是一个 String? 的类型。这是由于在 Optional Chaining 中我们在任意一个 ?. 的时候都可能遇到 nil 而提前返回，这个时候当然就只能拿到 nil 了。
 */

if let toyName = xiaoming.pet?.toy?.name {
    // 太好了，小明既有宠物，而且宠物还正好有个玩具
    print(toyName)
}

extension Toy {
    func play() {
        // ...
    }
}

xiaoming.pet?.toy?.play()

let pet = Pet()
pet.toy = Toy(name: "Swifter")
xiaoming.pet = pet

//let playClosure = {(child: Child) -> () in child.pet?.toy?.play()} // 返回值将永远不为 nil
let playClosure = {(child: Child) -> ()? in child.pet?.toy?.play()}

if let result: () = playClosure(xiaoming) {
    print(result)
    print("好开心~")
} else {
    print("没有玩具可以玩 :(")
}
