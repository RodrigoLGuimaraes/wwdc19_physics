import UIKit
import SpriteKit
import PlaygroundSupport

public class Launcher {

    let sceneView: SKView
    
    public init() {
        sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
    }
    
    private func configure(scene: SKScene, debug: Bool = false) {
        scene.scaleMode = .aspectFit
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
    
    public func start(with script: Script) {
        var scriptControllers: [ScriptController]!
        if script == Script.defaultScript {
            scriptControllers = ScriptConstants.defaultScript
        }
        if case let Script.customScript(customScriptControllers) = script {
            scriptControllers = customScriptControllers
        }
        
        let scene = GameScene(size: sceneView.frame.size,
                              scriptControllers: scriptControllers)
        self.configure(scene: scene)
        self.present(scene: scene)
    }
}
