import Foundation
import SpriteKit

public class SolidColorizer: Colorizer {
    
    private let color: SKColor
    
    init(color: SKColor) {
        self.color = color
    }
    
    public func updateColor(_ nodes: [SKSpriteNode], at: TimeInterval) {
        nodes.forEach { (node) in
            node.color = color
        }
    }
}
