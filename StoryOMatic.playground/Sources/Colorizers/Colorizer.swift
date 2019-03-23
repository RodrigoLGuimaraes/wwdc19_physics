import SpriteKit

public protocol Colorizer {
    func updateColor(_ nodes: [SKSpriteNode], at: TimeInterval)
}
