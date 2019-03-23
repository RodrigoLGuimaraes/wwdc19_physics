import Foundation
import UIKit

struct LabelConstraints {
    var leftConstraint: NSLayoutConstraint
    var rightConstraint: NSLayoutConstraint
    var yConstraint: NSLayoutConstraint
    
    init(leftConstraint: NSLayoutConstraint,
         rightConstraint: NSLayoutConstraint,
         yConstraint: NSLayoutConstraint) {
        self.leftConstraint = leftConstraint
        self.rightConstraint = rightConstraint
        self.yConstraint = yConstraint
    }
}
