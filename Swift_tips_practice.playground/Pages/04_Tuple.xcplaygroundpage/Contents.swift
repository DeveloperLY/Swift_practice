//
//  04_Tuple.swift
//  Swift_tips_practice
//
//  Created by LiuY on 2022/6/13.
//
//

import UIKit

// 多元组（Tuple）

// 不使用多元组
func swapMe1<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

// 使用多元组，可以不使用额外空间
func swapMe2<T>(a: inout T, b: inout T) {
    (a, b) = (b, a)
}

var a = 3
var b = 5

(a, b)
swapMe1(a: &a, b: &b)
(a, b)

swapMe2(a: &a, b: &b)
(a, b)


// CGRect 有一个辅助方法叫做 CGRectDivide，它用来将一个 CGRect 在一定位置切分成两个区域。

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)

let (small, large) = rect.divided(atDistance: 20, from: .minXEdge)

small
large
