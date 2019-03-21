import Foundation
import SpriteKit

public class DefaultBehaviourManager: BehaviourManager {
    public func performBehavior(on behavers: [SKSpriteNode], given stimulusLocation: CGPoint) {
        behavers.forEach { (behaver) in
            behaver.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1000))
        }
    }
}
