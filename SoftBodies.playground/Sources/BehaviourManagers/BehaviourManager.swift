import Foundation
import SpriteKit

public protocol BehaviourManager {
    func performBehavior(on behavers: [SKSpriteNode], given stimulusLocation: CGPoint)
}
