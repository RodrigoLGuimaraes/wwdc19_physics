//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    private var circles = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        for _ in 0...20 {
            let littlePerson = LittlePersonBuilder()
                .addInto(scene: self)
                .with(bodySize: 50)
                .with(memberSize: 14)
                .build()
            self.circles.append(littlePerson)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
//sceneView.showsPhysics = true
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
