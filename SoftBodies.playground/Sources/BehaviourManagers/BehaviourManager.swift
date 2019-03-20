import Foundation
import SpriteKit

protocol BehaviourManager {
    func performBehavior(on behavers: [SKSpriteNode], given stimulusLocation: CGPoint)
}
