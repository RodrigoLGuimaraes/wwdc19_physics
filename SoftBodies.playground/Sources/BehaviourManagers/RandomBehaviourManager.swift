import Foundation
import SpriteKit

public class RandomBehaviourManager: BehaviourManager {
    public func performBehavior(on behavers: [SKSpriteNode], given stimulusLocation: CGPoint) {
        behavers.forEach { (behaver) in
            let totalForce: CGFloat = 4000
            let xDirection: CGFloat = Bool.random() ? 1 : -1
            let yDirection: CGFloat = Bool.random() ? 1 : -1
            let xForce: CGFloat = CGFloat.random(in: 0...totalForce)
            let yForce = (totalForce - xForce)
            
            behaver.physicsBody?.applyImpulse(CGVector(dx: xDirection * xForce,
                                                       dy: yDirection * yForce))
        }
    }
}
