import Foundation
import UIKit

public class ShakeTextAnimator: TextAnimator {
    
    private let minAngle: CGFloat
    private let maxAngle: CGFloat
    private let duration: TimeInterval
    
    public init(minAngle: CGFloat = -0.03, maxAngle: CGFloat = 0.03, duration: TimeInterval = 2) {
        self.minAngle = minAngle
        self.maxAngle = maxAngle
        self.duration = duration
    }
    
    public func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval) {
        let percentage = self.percentage(at: time, given: duration)
        let currentAngle = minAngle + percentage * (maxAngle - minAngle)
        label.transform = CGAffineTransform(rotationAngle: currentAngle)
        label.layoutIfNeeded()
    }
}
