import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    private var circles = [SKSpriteNode]()
    
    public override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.createSubParticles()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else {
            return
        }
        
        for circle in self.circles {
            let totalForce: CGFloat = 4000
            let xDirection: CGFloat = Bool.random() ? 1 : -1
            let yDirection: CGFloat = Bool.random() ? 1 : -1
            let xForce: CGFloat = CGFloat.random(in: 0...totalForce)
            let yForce =  (totalForce - xForce)
            
            circle.physicsBody?.applyImpulse(CGVector(dx: xDirection * xForce,
                                                      dy: yDirection * yForce))
        }
    }
}

extension GameScene {
    func createSubParticles() {
        for _ in 0...200 {
            let littlePerson = LittlePersonBuilder()
                .addInto(scene: self)
                .with(bodySize: 15)
                .with(memberSize: 9)
                .build()
            self.circles.append(littlePerson)
        }
    }
}
