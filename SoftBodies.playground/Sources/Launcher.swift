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
        scene.gameSceneDelegate = self
        self.configure(scene: scene)
        self.present(scene: scene)
    }
}

extension Launcher: GameSceneDelegate {
    public func didFinishAllScriptForScene() {
        print("time to put over")
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.sceneView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sceneView.addSubview(blurEffectView)
        
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Regular", size: 30)
        label.textColor = UIColor(red: 0.94, green: 0.96, blue: 0.98, alpha: 0.8)
        label.numberOfLines = 1
        self.sceneView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.sceneView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.sceneView.centerXAnchor).isActive = true
        label.text = "THE END"
        
        let subtitleLabel = UILabel(frame: CGRect.zero)
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont(name: "AvenirNext-Regular", size: 16)
        subtitleLabel.textColor = UIColor(red: 0.75, green: 0.77, blue: 0.785, alpha: 0.8)
        subtitleLabel.numberOfLines = 0
        self.sceneView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: self.sceneView.centerXAnchor).isActive = true
        subtitleLabel.text = "now tell your own story"
    }
}
