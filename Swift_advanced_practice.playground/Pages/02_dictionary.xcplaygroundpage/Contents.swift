// 字典

enum Setting {
    case text(String)
    case int(Int)
    case bool(Bool)
}

let defaultSettings: [String:Setting] = ["Airplane Mode": .bool(false), "Name": .text("My iPhone")]
defaultSettings["Name"] // text("My iPhone")

var userSettings = defaultSettings
userSettings["Name"] = .text("Jared's iPhone")
userSettings["Do Not Disturb"] = .bool(true)

let oldName = userSettings.updateValue(.text("Jane's iPhone"), forKey: "Name")
userSettings["Name"] // text("Jane\'s iPhone")
oldName // text("Jared\'s iPhone")


var settings = defaultSettings
let overriddenSettings: [String:Setting] = ["Name": .text("Jane's iPhone")]
settings.merge(overriddenSettings, uniquingKeysWith: { $1 })
settings
// ["Name": Setting.text("Jane\'s iPhone"), "Airplane Mode": Setting.bool(false)]

extension Sequence where Element: Hashable {
    var frequencies: [Element:Int] {
        let frequencyPairs = self.map { ($0, 1) }
        return Dictionary(frequencyPairs, uniquingKeysWith: +)
    }
}
let frequencies = "hello".frequencies // ["e": 1, "o": 1, "l": 2, "h": 1]
frequencies.filter { $0.value > 1 } // ["l": 2]


let settingsAsStrings = settings.mapValues { setting -> String in
    switch setting {
        case .text(let text): return text
        case .int(let number): return String(number)
        case .bool(let value): return String(value)
    }
}
settingsAsStrings // ["Name": "Jane\'s iPhone", "Airplane Mode": "false"]
