import Foundation
import UIKit

protocol TextAnimator {
    func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval)
}
