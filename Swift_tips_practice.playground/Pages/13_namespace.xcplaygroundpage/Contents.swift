// 命名空间

import Foundation

/**
 在 Swift 中，由于可以使用命名空间了，即使是名字相同的类型，只要是来自不同的命名空间的话，都是可以和平共处的。和 C# 这样的显式在文件中指定命名空间的做法不同，Swift 的命名空间是基于 module 而不是在代码中显式地指明，每个 module 代表了 Swift 中的一个命名空间。也就是说，同一个 target 里的类型名称还是不能相同的。在我们进行 app 开发时，默认添加到 app 的主 target 的内容都是处于同一个命名空间中的，我们可以通过创建 Cocoa (Touch) Framework 的 target 的方法来新建一个 module，这样我们就可以在两个不同的 target 中添加同样名字的类型了
 */

// 另一种策略是使用类型嵌套的方法来指定访问的范围。常见做法是将名字重复的类型定义到不同的 struct 中，以此避免冲突。这样在不使用多个 module 的情况下也能取得隔离同样名字的类型的效果：

struct MyClassContainer1 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer1")
        }
    }
}

struct MyClassContainer2 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer2")
        }
    }
}
