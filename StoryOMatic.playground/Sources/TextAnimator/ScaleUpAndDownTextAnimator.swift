import Foundation
import UIKit

public class ScaleUpAndDownTextAnimator: TextAnimator {
    
    private let minSize: CGFloat
    private let maxSize: CGFloat
    private let duration: TimeInterval
    
    public init(minSize: CGFloat = 0.8, maxSize: CGFloat = 1.2, duration: TimeInterval = 2) {
        self.minSize = minSize
        self.maxSize = maxSize
        self.duration = duration
    }
    
    public func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval) {
        let percentage = self.percentage(at: time, given: duration)
        let currentSize = minSize + percentage * (maxSize - minSize)
        label.transform = CGAffineTransform(scaleX: currentSize, y: currentSize)
        label.layoutIfNeeded()
    }
}
