import Foundation
import UIKit

struct ElementConfiguration {
    var numberOfElements: Int
    var bodySize: CGFloat
    var memberSize: CGFloat
    var keepToNextGeneration: Bool
    
    init(numberOfElements: Int, bodySize: Double, memberSize: Double, keepToNextGeneration: Bool = true) {
        self.numberOfElements = numberOfElements
        self.bodySize = CGFloat(bodySize)
        self.memberSize = CGFloat(memberSize)
        self.keepToNextGeneration = keepToNextGeneration
    }
}
