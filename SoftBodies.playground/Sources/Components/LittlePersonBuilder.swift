import Foundation
import SpriteKit

public class LittlePersonBuilder {
    
    private var scene: SKScene?
    private var bodySize: CGSize = CGSize(width: 10, height: 10)
    private var memberSize: CGSize = CGSize(width: 10, height: 10)
    private var backgroundColor: SKColor = SKColor.clear
    
    private var distance: CGFloat {
        return self.bodySize.height/2 + self.memberSize.height/2
    }
    
    public init() {}
    
    public func addInto(scene: SKScene?) -> LittlePersonBuilder {
        self.scene = scene
        return self
    }
    
    public func with(color: SKColor) -> LittlePersonBuilder {
        self.backgroundColor = color
        return self
    }
    
    public func with(bodySize: CGFloat) -> LittlePersonBuilder {
        self.bodySize = CGSize(width: bodySize, height: bodySize)
        return self
    }
    
    public func with(memberSize: CGFloat) -> LittlePersonBuilder {
        self.memberSize = CGSize(width: memberSize, height: memberSize)
        return self
    }
    
    public func build() -> SKSpriteNode {
        
        let body = self.createBody()
        body.position = self.calculatePosition()
        self.scene?.addChild(body)
        
        let numberOfMembers = self.calculateNumberOfMembers()
        for memberNumber in 0..<numberOfMembers {
            
            let currentAngleBetweenBodyAndMember = (2 * CGFloat.pi / CGFloat(numberOfMembers)) * CGFloat(memberNumber)
        
            let x_offset: CGFloat = 2 * distance * cos(currentAngleBetweenBodyAndMember)
            let y_offset: CGFloat = 2 * distance * sin(currentAngleBetweenBodyAndMember)
            
            let point: SKSpriteNode = SKSpriteNode(color: UIColor.gray,
                                                   size: self.memberSize)
            point.position = CGPoint(x: x_offset,
                                     y: y_offset)
            
            point.physicsBody = SKPhysicsBody(circleOfRadius: self.memberSize.height)
            point.physicsBody?.isDynamic = true
            point.physicsBody?.affectedByGravity = true
            point.physicsBody?.mass = 1/3
            
            body.addChild(point)
            
            let joint = SKPhysicsJointSpring.joint(withBodyA: body.physicsBody!,
                                                   bodyB: point.physicsBody!,
                                                   anchorA: body.position,
                                                   anchorB: body.position + point.position)
            
            joint.damping = 3
            joint.frequency = 15
            
            self.scene?.physicsWorld.add(joint)
        }
        
        return body
    }
}

extension LittlePersonBuilder {
    private func calculatePosition() -> CGPoint {
        let margin = self.memberSize.width + self.bodySize.width
        
        let minX = margin + (self.scene?.frame.minX ?? -200)
        let maxX = (self.scene?.frame.maxX ?? 200) - margin
        let minY = margin + (self.scene?.frame.minY ?? -200)
        let maxY = (self.scene?.frame.maxY ?? 200) - margin
        
        let xPosition = CGFloat.random(in: minX...maxX)
        let yPosition = CGFloat.random(in: minY...maxY)
        
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    private func calculateNumberOfMembers() -> Int {
        let angleBetweenMembers = 2 * asin(self.memberSize.width/2/distance)
        let numberOfMembers = Int(2 * CGFloat.pi / angleBetweenMembers)
        return numberOfMembers
    }
    
    private func createBody() -> SKSpriteNode {
        let body = SKSpriteNode(color: SKColor.white,
                     size: self.bodySize)
        
        body.physicsBody = SKPhysicsBody(rectangleOf: self.bodySize)
        body.physicsBody?.isDynamic = true
        body.physicsBody?.affectedByGravity = false
        body.physicsBody?.mass = 4.0
        
        return body
    }
}
