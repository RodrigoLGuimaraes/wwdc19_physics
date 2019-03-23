import Foundation
import UIKit

public protocol TextAnimator {
    func animate(label: UILabel, labelConstraints: LabelConstraints, at time: TimeInterval)
}

extension TextAnimator {
    func percentage(at time: TimeInterval, given duration: TimeInterval) -> CGFloat {
        let clamppedTime = time.remainder(dividingBy: duration)
        let adjustedTime = clamppedTime > 0 ? clamppedTime : duration + clamppedTime
        let halfDuration = duration/2
        let percentage = adjustedTime < halfDuration ?
            CGFloat(adjustedTime / halfDuration) :
            CGFloat(1 - ((adjustedTime-halfDuration) / halfDuration))
        return percentage
    }
}
