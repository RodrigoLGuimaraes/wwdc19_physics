import Foundation
import UIKit

public struct ElementConfiguration {
    
    public static let justKeepOldElements = ElementConfiguration(numberOfElements: 0, bodySize: 1.0, memberSize: 1.0, keepToNextGeneration: true)
    
    var numberOfElements: Int
    var bodySize: CGFloat
    var memberSize: CGFloat
    var keepToNextGeneration: Bool
    
    public init(numberOfElements: Int, bodySize: Double, memberSize: Double, keepToNextGeneration: Bool = true) {
        self.numberOfElements = numberOfElements
        self.bodySize = CGFloat(bodySize)
        self.memberSize = CGFloat(memberSize)
        self.keepToNextGeneration = keepToNextGeneration
    }
}
