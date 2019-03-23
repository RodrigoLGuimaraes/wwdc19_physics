import Foundation
import SpriteKit

public class TimerColorizer: Colorizer {
    
    private let cycleTime: TimeInterval
    
    public init(cycleTime: TimeInterval = 3) {
        self.cycleTime = cycleTime
    }
    
    public func updateColor(_ nodes: [SKSpriteNode], at: TimeInterval) {
        let totalNodes = nodes.count
        
        nodes.enumerated().forEach { (index, node) in
            let offset = cycleTime * TimeInterval(index/totalNodes)
            let adjustedTime = (at + offset).truncatingRemainder(dividingBy: cycleTime) / cycleTime
            
            node.color = UIColor(hue: CGFloat(adjustedTime),
                                 saturation: 0.5,
                                 brightness: 0.5,
                                 alpha: 1)
        }
    }
}
