//
//  01_currying.swift
//  Swift_tips_practice
//
//  Created by LiuY on 2022/6/13.
//
//

import Foundation

// Swift 里可以将方法进行柯里化 (Currying)，这是也就是把接受多个参数的方法进行一些变形，使其更加灵活的方法
// eg:
func addOne(num: Int) -> Int {
    return num + 1
}

// 如果我们之后还需要一个将输入数字加 2，或者加 3 的函数，可能不得不类似地去定义返回为 num + 2 或者 num + 3 的版本
func addTo(_ adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let addTwo = addTo(2) // addTwo: Int -> Int
let result = addTwo(6) // result = 8

// 比较大小
func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer }
}

let greaterThan10 = greaterThan(10)

func greaterThanDemo() {
    _ = greaterThan10(8) // => false
    _ = greaterThan10(18) // => true
}

// 借助柯里化，安全的改造和利用 target-action
protocol TargetAction {
    func performAction()
}

struct TargetAcitonWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T, action: @escaping(T) -> () -> (), controlEvent: ControlEvent) {
        actions[controlEvent] = TargetAcitonWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}

// Usage:
class MyViewController {
    let button = Control()
    
    func viewDidLoad() {
        button.setTarget(target: self, action: MyViewController.onButtonTap, controlEvent: .TouchUpInside)
    }
    
    func onButtonTap() {
            print("Button was tapped")
        }
}
