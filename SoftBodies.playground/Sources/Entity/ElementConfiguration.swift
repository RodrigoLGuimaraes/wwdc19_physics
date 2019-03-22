import Foundation
import UIKit

struct ElementConfiguration {
    var numberOfElements: Int
    var bodySize: CGFloat
    var memberSize: CGFloat
    var keepToNextGeneration: Bool
    
    init(numberOfElements: Int, bodySize: CGFloat, memberSize: CGFloat, keepToNextGeneration: Bool = true) {
        self.numberOfElements = numberOfElements
        self.bodySize = bodySize
        self.memberSize = memberSize
        self.keepToNextGeneration = keepToNextGeneration
    }
}
