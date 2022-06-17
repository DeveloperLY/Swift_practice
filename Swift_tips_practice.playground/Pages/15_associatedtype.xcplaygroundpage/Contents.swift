// associatedtype

import Foundation

protocol Food {}

protocol Animal {
    associatedtype F
    func eat(_ food: F)
}

struct Meat: Food {}
struct Grass: Food {}

struct Tiger: Animal {
    func eat(_ food: Meat) {
        print("eat \(meat)")
    }
}
 
let meat = Meat()
Tiger().eat(meat)

struct Sheep: Animal {
    func eat(_ food: Grass) {
        print("eat \(food)")
    }
}

// 添加 associatedtype 后，Animal 协议就不能被当作独立的类型使用了

// error: protocol 'Animal' can only be used as a generic constraint because it has Self or associated type requirements
//func isDangerous(animal: Animal) -> Bool {
//    if animal is Tiger {
//        return true
//    } else {
//        return false
//    }
//}

func isDangerous<T: Animal>(animal: T) -> Bool {
    if animal is Tiger {
        return true
    } else {
        return false
    }
}

isDangerous(animal: Tiger())
isDangerous(animal: Sheep())
