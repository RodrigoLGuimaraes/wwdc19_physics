import Foundation
import UIKit
import SpriteKit

class SingleSentenceScriptController: ScriptController {
    weak var delegate: ScriptControllerDelegate?
    
    private let text: String
    private let elementConfiguration: ElementConfiguration
    private let startDelay: TimeInterval
    private let fadeTime: TimeInterval
    private let timeToRead: TimeInterval
    
    var behaviourManager: BehaviourManager
    var colorizer: Colorizer
    
    private var view: SKView?
    private var mainLabel: UILabel?
    private var targetElements = [SKSpriteNode]()
    
    init(text: String,
         elementConfiguration: ElementConfiguration,
         behaviourManager: BehaviourManager = DefaultBehaviourManager(),
         colorizer: Colorizer = DefaultColorizer(),
         startDelay: TimeInterval = 0,
         fadeTime: TimeInterval = 1.5) {
        self.text = text
        self.elementConfiguration = elementConfiguration
        self.behaviourManager = behaviourManager
        self.colorizer = colorizer
        self.startDelay = startDelay
        self.fadeTime = fadeTime
        self.timeToRead = ScriptControllerUtils.calculateTime(toRead: text, with: ReadSpeed.regular)
    }
    
    func initialize(view: SKView, remainingNodes: [SKSpriteNode]) {
        self.view = view
        self.targetElements = remainingNodes
        self.createMainLabel()
        self.createSubParticles()
    }
    
    func updateScript(at time: TimeInterval) {
        let timeToCompleteShowingLabel = startDelay + fadeTime
        let timeToStartDismissing = timeToCompleteShowingLabel + timeToRead
        let timeToFinishDismissingLabel = timeToStartDismissing + fadeTime
        
        guard let alpha = ScriptControllerUtils.calculateAlpha(currentTime: time,
                                                               timeToStartShowingLabel: startDelay,
                                                               timeToCompleteShowingLabel: timeToCompleteShowingLabel,
                                                               timeToStartDismissingLabel: timeToStartDismissing,
                                                               timeToFinishDismissingLabel: timeToFinishDismissingLabel) else {
                                                                self.finish()
                                                                return
        }
        
        if !elementConfiguration.keepToNextGeneration && time > timeToStartDismissing {
            self.targetElements.forEach { $0.alpha = alpha }
        }
        self.colorizer.updateColor(self.targetElements, at: time)
        mainLabel?.alpha = alpha
    }
    
    func performBehaviour(given touchLocation: CGPoint) {
        self.behaviourManager.performBehavior(on: self.targetElements, given: touchLocation)
    }
    
    func finish() {
        self.mainLabel?.alpha = 0
        self.mainLabel?.removeFromSuperview()
        
        if !elementConfiguration.keepToNextGeneration {
            for node in self.targetElements {
                node.removeFromParent()
            }
            
            self.targetElements = [SKSpriteNode]()
        }
        
        
        self.delegate?.didFinishScript(remainingNodes: self.targetElements)
    }
}

extension SingleSentenceScriptController {
    private func createMainLabel() {
        self.mainLabel = UILabel(frame: CGRect.zero)
        
        guard let mainLabel = self.mainLabel,
              let superview = self.view else {
                return
        }
        
        mainLabel.textAlignment = .center
        mainLabel.font = UIFont(name: "AvenirNext-Regular", size: 30)
        mainLabel.textColor = UIColor(red: 0.94, green: 0.96, blue: 0.98, alpha: 0.8)
        mainLabel.text = self.text
        
        superview.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 24).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -24).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 0).isActive = true
    }
    
    private func createSubParticles() {
        for _ in 0...elementConfiguration.numberOfElements {
            let littlePerson = LittlePersonBuilder()
                .addInto(scene: self.view?.scene)
                .with(bodySize: elementConfiguration.bodySize)
                .with(memberSize: elementConfiguration.memberSize)
                .build()
            
            self.targetElements.append(littlePerson)
        }
    }
}
