import Foundation
import UIKit

public class MoveUpAndDownTextAnimator: TextAnimator {
    
    private let amplitude: CGFloat
    private let duration: TimeInterval
    
    public init(amplitude: CGFloat = 80, duration: TimeInterval = 2) {
        self.amplitude = amplitude
        self.duration = duration
    }
    
    public func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval) {
        let percentage = self.percentage(at: time, given: duration)
        
        labelConstraints.yConstraint.constant = -amplitude/2 + percentage  * amplitude
        label.layoutIfNeeded()
    }
}
