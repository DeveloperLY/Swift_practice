// 条件编译

import UIKit

// 方法    可选参数
// os()    macOS, iOS, tvOS, watchOS, Linux
// arch()    x86_64, arm, arm64, i386
// swift()    >= 某个版本

#if os(macOS)
    typealias Color = NSColor
#else
    typealias Color = UIColor
#endif
