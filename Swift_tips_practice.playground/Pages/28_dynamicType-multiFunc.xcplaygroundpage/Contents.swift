// 动态类型和多方法

import Foundation

// 重载
class Pet {}
class Cat: Pet {}
class Dog: Pet {}

func printPet(_ pet: Pet) {
    print("Pet")
}

func printPet(_ cat: Cat) {
    print("Meow")
}

func printPet(_ dog: Dog) {
    print("Bark")
}

printPet(Cat()) // Meow
printPet(Dog()) // Bark
printPet(Pet()) // Pet

// 因为 Swift 默认情况下是不采用动态派发的，因此方法的调用只能在编译时决定。
//func printThem(_ pet: Pet, _ cat: Cat) {
//    printPet(pet)
//    printPet(cat)
//}
//
//printThem(Dog(), Cat())

// 输出：
// Pet
// Meow

func printThem(_ pet: Pet, _ cat: Cat) {
    if let aCat = pet as? Cat {
        printPet(aCat)
    } else if let aDog = pet as? Dog {
        printPet(aDog)
    }
    printPet(cat)
}

printThem(Dog(), Cat())

// 输出：
// Bark
// Meow

