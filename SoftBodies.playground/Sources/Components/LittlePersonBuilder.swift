import Foundation
import SpriteKit

public class LittlePersonBuilder {
    
    var scene: SKScene?
    
    public init() {}
    
    public func addInto(scene: SKScene) -> LittlePersonBuilder {
        self.scene = scene
        return self
    }
    
    public func build() -> SKSpriteNode {
        
        let circle = SKSpriteNode(color: SKColor.white,
                                  size: CGSize(width: 10, height: 10))
        
        let xPosition = CGFloat.random(in: -200...200)
        let yPosition = CGFloat.random(in: -200...200)
        
        circle.position = CGPoint(x: xPosition, y: yPosition)
        circle.name = "player"
        
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        circle.physicsBody?.isDynamic = true
        circle.physicsBody?.affectedByGravity = false
        circle.physicsBody?.mass = 4.0
        
        self.scene?.addChild(circle)
        
        for loop in 0..<6 {
            
            let angle: CGFloat = ((CGFloat(M_PI) * 2)/6) * CGFloat(loop)
            
            var x_offset: CGFloat = cos(angle)
            var y_offset: CGFloat = sin(angle)
            
            x_offset *= 20
            y_offset *= 20
            
            let point: SKSpriteNode = SKSpriteNode(color: UIColor.gray,
                                                   size: CGSize(width: 10, height: 10))
            point.position = CGPoint(x: x_offset,
                                     y: y_offset)
            point.name = "samllcircle"
            
            point.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            point.physicsBody?.isDynamic = true
            point.physicsBody?.affectedByGravity = true
            point.physicsBody?.mass = 2/6
            
            circle.addChild(point)
            
            let joint = SKPhysicsJointSpring.joint(withBodyA: circle.physicsBody!,
                                                   bodyB: point.physicsBody!,
                                                   anchorA: circle.position,
                                                   anchorB: circle.position + point.position)
            
            joint.damping = 2.0
            joint.frequency = 9.0
            
            self.scene?.physicsWorld.add(joint)
        }
        
        return circle
    }
}
