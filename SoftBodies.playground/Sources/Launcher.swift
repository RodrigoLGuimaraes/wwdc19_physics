import UIKit
import SpriteKit
import PlaygroundSupport

public class Launcher {

    let sceneView: SKView
    
    public init() {
        sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
    }
    
    private func configure(scene: SKScene, debug: Bool = false) {
        scene.scaleMode = .aspectFill
        sceneView.showsPhysics = debug
        sceneView.showsFPS = debug
        sceneView.showsDrawCount = debug
        sceneView.showsNodeCount = debug
    }
    
    private func present(scene: SKScene) {
        sceneView.presentScene(scene)
        PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    public func start() {
        self.launchInitialScene()
    }
    
    public func launchInitialScene() {
        let initialScript = [
            SingleSentenceScriptController(text: "Hello",
                                           elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15, memberSize: 9),
                                           behaviourManager: DefaultBehaviourManager(),
                                           colorizer: DefaultColorizer(),
                                           startDelay: 1),
            SingleSentenceScriptController(text: "How are you doing?",
                                           elementConfiguration: ElementConfiguration(numberOfElements: 2, bodySize: 15, memberSize: 15),
                                           behaviourManager: DefaultBehaviourManager(),
                                           colorizer: DefaultColorizer(),
                                           startDelay: 1),
            SingleSentenceScriptController(text: "I'm fine, glad you asked.",
                                           elementConfiguration: ElementConfiguration(numberOfElements: 3, bodySize: 9, memberSize: 15),
                                           behaviourManager: DefaultBehaviourManager(),
                                           colorizer: DefaultColorizer(),
                                           startDelay: 1),
        ]
        
        let scene = GameScene(size: sceneView.frame.size,
                              scriptControllers: initialScript)
        self.configure(scene: scene)
        self.present(scene: scene)
    }
}
