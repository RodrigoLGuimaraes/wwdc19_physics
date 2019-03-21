import Foundation
import UIKit

class SingleSentenceScriptController: ScriptController {
    weak var delegate: ScriptControllerDelegate?
    
    private let text: String
    private let startDelay: TimeInterval
    private let fadeTime: TimeInterval
    private let timeToRead: TimeInterval
    
    init(text: String, startDelay: TimeInterval = 0, fadeTime: TimeInterval = 3) {
        self.text = text
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
