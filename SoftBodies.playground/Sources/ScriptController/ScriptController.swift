import Foundation
import UIKit
import SpriteKit

public protocol ScriptController {
    func initialize(view: SKView, remainingNodes: [SKSpriteNode])
    func updateScript(at time: TimeInterval)
    func performBehaviour(given touchLocation: CGPoint)
    var delegate: ScriptControllerDelegate? { get set }
    var behaviourManager: BehaviourManager { get set }
    var colorizer: Colorizer { get set }
}
