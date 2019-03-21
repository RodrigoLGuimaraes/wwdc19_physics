import Foundation
import UIKit

public protocol ScriptController {
    func updateScript(mainLabel: UILabel, at: TimeInterval)
    weak var delegate: ScriptControllerDelegate? { get set }
}
