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
        let scene = GameScene(size: sceneView.frame.size,
                              behaviourManager: nil,
                              colorizer: nil,
                              scriptControllers: [
                SingleSentenceScriptController(text: "Hello", startDelay: 1),
                SingleSentenceScriptController(text: "How Are you doing?"),
                SingleSentenceScriptController(text: "I'm fine, glad you asked."),
            ])
        self.configure(scene: scene)
        self.present(scene: scene)
    }
}
