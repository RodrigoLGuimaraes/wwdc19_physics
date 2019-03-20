import UIKit
import SpriteKit
import PlaygroundSupport

public class Launcher {
    public static func launch() {
        let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
        //sceneView.showsPhysics = true
        let scene = GameScene(size: sceneView.frame.size, test: "bla")
        scene.scaleMode = .aspectFill
        sceneView.presentScene(scene)
        PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
}
