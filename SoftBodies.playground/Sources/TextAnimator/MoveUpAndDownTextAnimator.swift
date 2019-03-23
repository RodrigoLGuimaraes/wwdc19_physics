import Foundation
import UIKit

class MoveUpAndDownTextAnimator: TextAnimator {
    
    private let amplitude: CGFloat
    private let duration: TimeInterval
    
    init(amplitude: CGFloat = 80, duration: TimeInterval = 1) {
        self.amplitude = amplitude
        self.duration = duration
    }
    
    func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval) {
        let clamppedTime = time.remainder(dividingBy: duration)
        let adjustedTime = clamppedTime > 0 ? clamppedTime : duration + clamppedTime
        let halfDuration = duration/2
        let percentage = adjustedTime < halfDuration ?
            CGFloat(adjustedTime / halfDuration) :
            CGFloat(1 - ((adjustedTime-halfDuration) / halfDuration))
        
        labelConstraints.yConstraint.constant = -amplitude/2 + percentage  * amplitude
    }
}
