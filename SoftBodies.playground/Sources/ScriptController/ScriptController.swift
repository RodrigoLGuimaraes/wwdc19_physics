import Foundation
import UIKit

public protocol ScriptController {
    func updateScript(mainLabel: UILabel, at: TimeInterval)
    var delegate: ScriptControllerDelegate? { get set }
    var behaviourManager: BehaviourManager { get set }
    var colorizer: Colorizer { get set }
}
