import Foundation
import SpriteKit

public class LittlePersonBuilder {
    
    var scene: SKScene?
    var bodySize: CGSize = CGSize(width: 10, height: 10)
    var memberSize: CGSize = CGSize(width: 10, height: 10)
    var numberOfMembers: Int = 6
    
    public init() {}
    
    public func addInto(scene: SKScene) -> LittlePersonBuilder {
        self.scene = scene
        return self
    }
    
    public func with(bodySize: CGSize) -> LittlePersonBuilder {
        self.bodySize = bodySize
        return self
    }
    
    public func with(numberOfMembers: Int) -> LittlePersonBuilder {
        self.numberOfMembers = numberOfMembers
        return self
    }
    
    public func build() -> SKSpriteNode {
        
        let circle = SKSpriteNode(color: SKColor.white,
                                  size: self.bodySize)
        
        circle.physicsBody = SKPhysicsBody(rectangleOf: self.bodySize)
        circle.physicsBody?.isDynamic = true
        circle.physicsBody?.affectedByGravity = false
        circle.physicsBody?.mass = 4.0
        
        circle.position = self.calculatePosition()
        self.scene?.addChild(circle)
        
        for memberNumber in 0..<numberOfMembers {
            
            let currentAngleBetweenBodyAndMember = (2 * CGFloat.pi / CGFloat(numberOfMembers)) * CGFloat(memberNumber)
            
            let x_offset: CGFloat = 20 * cos(currentAngleBetweenBodyAndMember)
            let y_offset: CGFloat = 20 * sin(currentAngleBetweenBodyAndMember)
            
            let point: SKSpriteNode = SKSpriteNode(color: UIColor.gray,
                                                   size: self.memberSize)
            point.position = CGPoint(x: x_offset,
                                     y: y_offset)
            
            point.physicsBody = SKPhysicsBody(circleOfRadius: self.memberSize.height)
            point.physicsBody?.isDynamic = true
            point.physicsBody?.affectedByGravity = true
            point.physicsBody?.mass = 1/3
            
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

extension LittlePersonBuilder {
    private func calculatePosition() -> CGPoint {
        let minX = self.scene?.frame.minX ?? -200
        let maxX = self.scene?.frame.maxX ?? 200
        let minY = self.scene?.frame.minY ?? -200
        let maxY = self.scene?.frame.maxY ?? 200
        
        let xPosition = CGFloat.random(in: minX...maxX)
        let yPosition = CGFloat.random(in: minY...maxY)
        
        return CGPoint(x: xPosition, y: yPosition)
    }
}
