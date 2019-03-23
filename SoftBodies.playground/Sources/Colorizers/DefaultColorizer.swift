import SpriteKit

public class DefaultColorizer: Colorizer {
    
    public init() {}
    
    public func updateColor(_ nodes: [SKSpriteNode], at: TimeInterval) {
        nodes.forEach { (node) in
            guard let velocity = node.physicsBody?.velocity else {
                return
            }
            
            let colorDirection = CGVector(dx: 0.5, dy: 0.5) + (velocity.normalized() / 2)
            
            node.color = UIColor(hue: colorDirection.dx, saturation: colorDirection.dy, brightness: velocity.length / 1000, alpha: 1)
        }
    }
}
