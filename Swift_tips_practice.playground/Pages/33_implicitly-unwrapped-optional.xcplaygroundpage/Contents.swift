// 隐式解包 Optional(ImplicitlyUnwrappedOptional)

import Foundation

class MyClass {
    func foo() {
        print("foo...")
    }
}

var maybeObject: MyClass! = MyClass()

maybeObject!.foo()
maybeObject.foo()
