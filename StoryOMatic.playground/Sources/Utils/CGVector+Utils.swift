import SpriteKit

extension CGVector {
    public var length: CGFloat {
        return sqrt((dx*dx) + (dy*dy))
    }
    
    func normalized() -> CGVector {
        guard self.length > 0 else { return CGVector.zero }
        
        return self / self.length
    }
    
    static func *(lhs: CGFloat, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs * rhs.dx, dy: lhs * rhs.dy)
    }
    
    static func /(lhs: CGVector, rhs: CGFloat) -> CGVector {
        return CGVector(dx: lhs.dx / rhs, dy: lhs.dy / rhs)
    }
    
    static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }
    
    static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }
}

