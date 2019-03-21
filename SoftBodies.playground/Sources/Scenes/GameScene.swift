import Foundation
import SpriteKit

public protocol GameSceneDelegate: class {
    func didFinishAllScriptForScene()
}

public class GameScene: SKScene {
    
    private var circles = [SKSpriteNode]()
    private var mainLabel = UILabel(frame: CGRect.zero)
    
    static private let InvalidTime: TimeInterval = -1
    var currentScriptInitialTime: TimeInterval = GameScene.InvalidTime
    var scriptControllers: [ScriptController]
    
    weak var gameSceneDelegate: GameSceneDelegate?
    
    public convenience init(size: CGSize,
                            scriptControllers: [ScriptController]) {
        self.init(size: size)
        
        self.scriptControllers = scriptControllers
        self.nextScript()
    }
    
    private func nextScript() {
        guard var nextScript = self.scriptControllers.first else {
            self.gameSceneDelegate?.didFinishAllScriptForScene()
            return
        }
        
        self.currentScriptInitialTime = GameScene.InvalidTime
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
        self.createMainLabel()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let target = touches.first else {
            return
        }
        
        self.scriptControllers.first?
            .behaviourManager.performBehavior(on: self.circles,
                                              given: target.location(in: self.view))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if self.currentScriptInitialTime == GameScene.InvalidTime {
            self.currentScriptInitialTime = currentTime
        }
        
        self.scriptControllers.first?.colorizer.updateColor(circles, at: currentTime)
        self.scriptControllers.first?.updateScript(mainLabel: self.mainLabel,
                                                   at: currentTime - self.currentScriptInitialTime)
    }
}

extension GameScene {
    func createMainLabel() {
        self.mainLabel = UILabel(frame: CGRect.zero)
        self.mainLabel.textAlignment = .center
        self.mainLabel.font = UIFont(name: "AvenirNext-Regular", size: 30)
        self.mainLabel.textColor = UIColor(red: 0.94, green: 0.96, blue: 0.98, alpha: 0.8)
        self.mainLabel.text = ""
        
        //Positioning
        guard let superview = self.view else {
            return
        }
        superview.addSubview(self.mainLabel)
        self.mainLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mainLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 24).isActive = true
        self.mainLabel.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -24).isActive = true
        self.mainLabel.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0).isActive = true
        self.mainLabel.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 0).isActive = true
    }
    
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
        nextScript()
    }
}
