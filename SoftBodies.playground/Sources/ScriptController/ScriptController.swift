import Foundation
import SpriteKit

public protocol ScriptController {
    func updateScript(mainLabel: SKLabelNode, at: TimeInterval)
    weak var delegate: ScriptControllerDelegate? { get set }
}
