import Foundation
import UIKit

public class LeftAndRightTextAnimator: TextAnimator {
    
    private var amplitude: CGFloat = 0
    private let duration: TimeInterval
    
    static let invalidMargin: CGFloat = -123456
    
    var originalLeftMargin: CGFloat = LeftAndRightTextAnimator.invalidMargin
    var originalRightMargin: CGFloat = LeftAndRightTextAnimator.invalidMargin
    
    public init(duration: TimeInterval = 2) {
        self.duration = duration
    }
    
    private func saveOriginalMargins(labelConstraints: LabelConstraints) {
        if originalLeftMargin == LeftAndRightTextAnimator.invalidMargin {
            originalLeftMargin = labelConstraints.leftConstraint.constant
        }
        
        if originalRightMargin == LeftAndRightTextAnimator.invalidMargin {
            originalRightMargin = labelConstraints.rightConstraint.constant
        }
        
        self.amplitude = abs(originalLeftMargin) + abs(originalRightMargin)
    }
    
    public func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval) {
        self.saveOriginalMargins(labelConstraints: labelConstraints)
        
        let percentage = self.percentage(at: time, given: duration)
        
        labelConstraints.leftConstraint.constant = -amplitude/2 + percentage  * amplitude
        labelConstraints.rightConstraint.constant = -amplitude/2 + percentage  * amplitude
        label.layoutIfNeeded()
    }
}
