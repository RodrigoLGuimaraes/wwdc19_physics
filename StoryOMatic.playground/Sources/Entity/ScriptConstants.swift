import Foundation
import SpriteKit

struct ScriptConstants {
    private init() {}
    
    static let defaultScript: [ScriptController] = [
        SingleSentenceScriptController(text: "Hello, this is Me.",
                                       textAnimator: ShakeTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        SingleSentenceScriptController(text: "Yeah, I’m kind of chubby…",
                                       textAnimator: ScaleUpAndDownTextAnimator(minSize: 0.9, maxSize: 1.1, duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "But I can jump, tap on the screen and you’ll see!",
                                       textAnimator: MoveUpAndDownTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "That’s enough jumping… this is not a platform game.",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: EmptyBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "This is a story about how me…",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 11.0, memberSize: 7.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "…and a good friend…",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 11.0, memberSize: 7.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "overcame a big challenge!",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "We worked together, at a software consultancy.",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "We worked after hours a lot, and we were payed really bad...",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 120/255.0, green: 159/255.0, blue: 201/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "with the promise of getting stocks someday.",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 96/255.0, green: 127/255.0, blue: 161/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "Projects didn't work out, budget was really short...",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 77/255.0, green: 102/255.0, blue: 129/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "...and I started to think that I wasn't good enough.",
                                       textAnimator: MoveUpAndDownTextAnimator(amplitude: 20, duration: 5),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 62/255.0, green: 82/255.0, blue: 103/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "I was always a good student...",
                                       textAnimator: LeftAndRightTextAnimator(duration: 5),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 50/255.0, green: 66/255.0, blue: 82/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "...but was I not good enough to be a professional?",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer()),
        SingleSentenceScriptController(text: "We eventually gave up and quit...",
                                       textAnimator: EmptyTextAnimator(),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 50.0, memberSize: 0, keepToNextGeneration: false),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 77/255.0, green: 102/255.0, blue: 129/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "...and since I didn't have a job now...",
                                       textAnimator: ScaleUpAndDownTextAnimator(minSize: 0.9, maxSize: 1.1, duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: RandomBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 96/255.0, green: 127/255.0, blue: 161/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "...and neither did my friend...",
                                       textAnimator: LeftAndRightTextAnimator(duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 11.0, memberSize: 7.0, keepToNextGeneration: true),
                                       behaviourManager: RandomBehaviourManager(),
                                       colorizer: SolidColorizer(color: SKColor(red: 120/255.0, green: 159/255.0, blue: 201/255.0, alpha: 1))),
        SingleSentenceScriptController(text: "...we started a small consultancy ourselves.",
                                       textAnimator: LeftAndRightTextAnimator(duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 11.0, memberSize: 7.0, keepToNextGeneration: true),
                                       behaviourManager: RandomBehaviourManager(),
                                       colorizer: TimerColorizer(cycleTime: 5)),
        SingleSentenceScriptController(text: "We got our first clients...",
                                       textAnimator: LeftAndRightTextAnimator(duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 3, bodySize: 7.0, memberSize: 5.0, keepToNextGeneration: true),
                                       behaviourManager: RandomBehaviourManager(),
                                       colorizer: TimerColorizer(cycleTime: 3)),
        SingleSentenceScriptController(text: "...more and more each day...",
                                       textAnimator: LeftAndRightTextAnimator(duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 7, bodySize: 10.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: RandomBehaviourManager(),
                                       colorizer: TimerColorizer(cycleTime: 1.5)),
        SingleSentenceScriptController(text: "and we could finally move freely again!",
                                       textAnimator: LeftAndRightTextAnimator(duration: 3),
                                       elementConfiguration: ElementConfiguration(numberOfElements: 7, bodySize: 10.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: TargetedBehaviourManager(),
                                       colorizer: TimerColorizer(cycleTime: 0.3)),
        ]
}
