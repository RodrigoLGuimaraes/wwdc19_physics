import Foundation
import UIKit

class ScriptControllerUtils {
    static func calculateAlpha(currentTime: TimeInterval,
                               timeToStartShowingLabel: TimeInterval,
                               timeToCompleteShowingLabel: TimeInterval,
                               timeToStartDismissingLabel: TimeInterval,
                               timeToFinishDismissingLabel: TimeInterval) -> CGFloat? {
        
        let isAlreadyShown = currentTime > timeToCompleteShowingLabel && currentTime < timeToStartDismissingLabel
        if isAlreadyShown {
            return 1
        }
        
        let isShowing = currentTime > timeToStartShowingLabel && currentTime < timeToCompleteShowingLabel
        if isShowing {
            return CGFloat((currentTime - timeToStartShowingLabel) / (timeToCompleteShowingLabel - timeToStartShowingLabel))
        }
        
        let isDismissing = currentTime > timeToStartDismissingLabel && currentTime < timeToFinishDismissingLabel
        if isDismissing {
            return 1 - CGFloat((currentTime - timeToStartDismissingLabel) / (timeToFinishDismissingLabel - timeToStartDismissingLabel))
        }
        
        if currentTime > timeToFinishDismissingLabel {
            return nil
        }
        
        return 0
    }
    
    static func calculateTime(toRead text: String, with readSpeed: ReadSpeed) -> TimeInterval {
        let words = text.split(separator: " ")
        var totalTime: TimeInterval = 0
        
        words.forEach { (word) in
            let wordSizeMultiplier = TimeInterval(String(word).wordSize.rawValue)
            let readSpeedMultiplier = TimeInterval(readSpeed.rawValue)
            totalTime += wordSizeMultiplier / readSpeedMultiplier
        }
        
        return totalTime
    }
}
