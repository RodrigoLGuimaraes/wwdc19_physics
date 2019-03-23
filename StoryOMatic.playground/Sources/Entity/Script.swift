import Foundation

public enum Script: Equatable {
    case defaultScript
    case customScript([ScriptController])
}

public func ==(lhs: Script, rhs: Script) -> Bool {
    switch (lhs, rhs) {
    case (.defaultScript, .defaultScript):
        return true
    case (.customScript, .customScript):
        return true
    default:
        return false
    }
}
