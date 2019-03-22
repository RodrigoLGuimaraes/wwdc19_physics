import Foundation
import SpriteKit

public protocol ScriptControllerDelegate: class {
    func didFinishScript(remainingNodes: [SKSpriteNode])
}
