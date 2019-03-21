import Foundation
import UIKit

class SingleSentenceScriptController: ScriptController {
    weak var delegate: ScriptControllerDelegate?
    
    private let text: String
    private let startDelay: TimeInterval
    private let fadeTime: TimeInterval
    private let timeToRead: TimeInterval
    
    var behaviourManager: BehaviourManager
    var colorizer: Colorizer
    
    init(text: String,
         behaviourManager: BehaviourManager = DefaultBehaviourManager(),
         colorizer: Colorizer = DefaultColorizer(),
         startDelay: TimeInterval = 0,
         fadeTime: TimeInterval = 1.5) {
        self.text = text
        self.behaviourManager = behaviourManager
        self.colorizer = colorizer
        self.startDelay = startDelay
        self.fadeTime = fadeTime
        self.timeToRead = ScriptControllerUtils.calculateTime(toRead: text, with: ReadSpeed.regular)
    }
    
    func updateScript(mainLabel: UILabel, at: TimeInterval) {
        mainLabel.text = self.text
        
        guard let alpha = ScriptControllerUtils.calculateAlpha(currentTime: at,
                                                               timeToStartShowingLabel: startDelay,
                                                               timeToCompleteShowingLabel: startDelay + fadeTime,
                                                               timeToStartDismissingLabel: startDelay + fadeTime + timeToRead,
                                                               timeToFinishDismissingLabel: startDelay + 2*fadeTime + timeToRead) else {
            self.delegate?.didFinishScript()
            return
        }
        
        mainLabel.alpha = alpha
    }
}
