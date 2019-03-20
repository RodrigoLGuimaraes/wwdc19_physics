import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    private var circles = [SKSpriteNode]()
    
    var behaviourManager: BehaviourManager = TargetedBehaviourManager()
    var colorizer: Colorizer = DefaultColorizer()
    
    public convenience init(size: CGSize, test: String) {
        self.init(size: size)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("coder initializer not implemented")
    }
    
    public override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.createSubParticles()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let target = touches.first else {
            return
        }
        
        behaviourManager.performBehavior(on: self.circles, given: target.location(in: self.view))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        self.colorizer.updateColor(circles, at: currentTime)
    }
}

extension GameScene {
    func createSubParticles() {
        for _ in 0...20 {
            let littlePerson = LittlePersonBuilder()
                .addInto(scene: self)
                .with(bodySize: 15)
                .with(memberSize: 9)
                .build()
            self.circles.append(littlePerson)
        }
    }
}
