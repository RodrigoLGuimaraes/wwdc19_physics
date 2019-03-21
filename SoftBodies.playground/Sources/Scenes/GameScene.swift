import Foundation
import SpriteKit

public protocol GameSceneDelegate: class {
    func didFinishAllScriptForScene()
}

public class GameScene: SKScene {
    
    private var circles = [SKSpriteNode]()
    
    var behaviourManager: BehaviourManager = DefaultBehaviourManager()
    var colorizer: Colorizer = DefaultColorizer()
    var scriptControllers: [ScriptController]
    
    weak var gameSceneDelegate: GameSceneDelegate?
    
    public convenience init(size: CGSize,
                            behaviourManager: BehaviourManager?,
                            colorizer: Colorizer?,
                            scriptControllers: [ScriptController]) {
        self.init(size: size)
        
        if let behaviourManager = behaviourManager {
            self.behaviourManager = behaviourManager
        }
        
        if let colorizer = colorizer {
            self.colorizer = colorizer
        }
        
        self.scriptControllers = scriptControllers
        
        guard var nextScript = self.scriptControllers.first else {
            return
        }
        
        nextScript.delegate = self
    }
    
    override init(size: CGSize) {
        self.scriptControllers = [ScriptController]()
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

extension GameScene: ScriptControllerDelegate {
    public func didFinishScript() {
        self.scriptControllers = Array(self.scriptControllers.dropFirst())
        
        guard var nextScript = self.scriptControllers.first else {
            self.gameSceneDelegate?.didFinishAllScriptForScene()
            return
        }
        
        nextScript.delegate = self
    }
}
