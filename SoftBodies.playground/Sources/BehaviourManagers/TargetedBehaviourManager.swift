import Foundation
import SpriteKit

class TargetedBehaviourManager: BehaviourManager {
    func performBehavior(on behavers: [SKSpriteNode], given stimulusLocation: CGPoint) {
        behavers.forEach { (behaver) in
            let totalForce: CGFloat = 4000
            
            let xDistance = stimulusLocation.x - behaver.position.x
            let yDistance = stimulusLocation.y - behaver.position.y
            
            let direction = CGVector(dx: xDistance,
                                     dy: yDistance).normalized()
            
            print("xDistance\(xDistance) - yDistance\(yDistance) - direction\(direction)")
            
            behaver.physicsBody?.applyImpulse(totalForce * direction)
        }
    }
}
