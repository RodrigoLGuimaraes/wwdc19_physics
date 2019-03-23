import Foundation

extension String {
    var wordSize: WordSize {
        if self.count <= 4 { return .small }
        if self.count <= 7 { return .regular }
        return .big
    }
}
