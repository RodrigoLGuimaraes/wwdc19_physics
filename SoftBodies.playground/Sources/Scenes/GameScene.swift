import Foundation
import SpriteKit

public protocol GameSceneDelegate: class {
    func didFinishAllScriptForScene()
}

public class GameScene: SKScene {
    
    private var circles = [SKSpriteNode]()
    
    static private let InvalidTime: TimeInterval = -1
    var currentScriptInitialTime: TimeInterval = GameScene.InvalidTime
    var scriptControllers: [ScriptController]
    
    weak var gameSceneDelegate: GameSceneDelegate?
    
    public convenience init(size: CGSize,
                            scriptControllers: [ScriptController]) {
        self.init(size: size)
        self.scriptControllers = scriptControllers
    }
    
    private func nextScript(remainingNodes: [SKSpriteNode] = [SKSpriteNode]()) {
        guard var nextScript = self.scriptControllers.first,
              let skView = self.view else {
            self.gameSceneDelegate?.didFinishAllScriptForScene()
            return
        }
        
        self.currentScriptInitialTime = GameScene.InvalidTime
        nextScript.initialize(view: skView, remainingNodes: remainingNodes)
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
        super.didMove(to: view)
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.nextScript()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let target = touches.first else {
            return
        }
        
        self.scriptControllers.first?.performBehaviour(given: target.location(in: self.view))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if self.currentScriptInitialTime == GameScene.InvalidTime {
            self.currentScriptInitialTime = currentTime
        }
        
        self.scriptControllers.first?.updateScript(at: currentTime - self.currentScriptInitialTime)
    }
}

extension GameScene: ScriptControllerDelegate {
    
    public func didFinishScript(remainingNodes: [SKSpriteNode]) {
        self.scriptControllers = Array(self.scriptControllers.dropFirst())
        nextScript(remainingNodes: remainingNodes)
    }
}
