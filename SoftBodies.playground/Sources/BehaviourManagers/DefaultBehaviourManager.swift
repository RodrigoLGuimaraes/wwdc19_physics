import Foundation
import SpriteKit

class DefaultBehaviourManager: BehaviourManager {
    func performBehavior(on behavers: [SKSpriteNode], given stimulusLocation: CGPoint) {
        behavers.forEach { (behaver) in
            behaver.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1000))
        }
    }
}
