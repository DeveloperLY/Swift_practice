// Log 输出

import Foundation

func method() {
    //...
    print("文件名:Test.swift, 方法名:method，这是一条输出")
    //...
}

method()

func printLog<T>(_ message: T,
    file: String = #file, // 包含这个符号的文件路径
    method: String = #function, // 包含这个符号的方法名称
    line: Int = #line) // 符号出现处的行号 column: Int = #column 符号出现处的列
{
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}

// Test.swift
func method1() {
    //...
    printLog("这是一条输出")
    //...
}

method1()

func printLogDebug<T>(_ message: T,
    file: String = #file,
    method: String = #function,
    line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

func method2() {
    //...
    printLogDebug("这又是一条输出")
    //...
}

method2()
// No Output
