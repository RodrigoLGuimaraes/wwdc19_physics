/*:
 # Story-o-matic
 
 The idea of this project is to enable people to tell their stories in a meaningful and interactive way.
 
 The story watcher is able to tap on the screen and see the entities behave in different ways depending on the scene.
 The entities can have different sizes and colors depending on the scene.
 
 Also, it is possible to add some text and some text animations.
 
 ---
 
 ## Experiencing the demo story:
 
 Just run the playground and be sure to tap the screen from time to time and see how the entities move.
 Moreover, pay attention to the colors and text animations that try and create the mood.
 
 ---
 
 ## Create your own story:
 
 Right below we have an array with all the scenes. Each scene has the following:
 
 - **Text**: This is the text that will be shown on the screen.
 - Note: There is an algorithm that estimate the read time based on the number of words and the word sizes, so you don't have to keep typing it for each string.
 - **TextAnimator**: This is the effect that the text will display. The options are: EmptyTextAnimator, LeftAndRightTextAnimator, MoveUpAndDownTextAnimator, ScaleUpAndDownTextAnimator and ShakeTextAnimator. You can easily create new ones by creating a class that conforms to the TextAnimator protocol.
 - **ElementConfiguration**: This element configures the entities that will be created or deleted on this scene. You have to set the numberOfElements that will be created, the bodySize and memberSize of those elements, and the keepToNextGeneration property, which will decide if the entities will carry to the next scene.
 - **BehaviourManager**: This is the class that controls the movement of the enities. The options are: DefaultBehaviourManager(jump up), EmptyBehaviourManager, RandomBehaviourManager and TargetedBehaviourManager(follows the tap). You can easily create new ones by creating a class that conforms to the BehaviourManager protocol.
 - **Colorizer**: This is the class that controls the color of the enities. The options are: SolidColorizer, TimerColorizer and DefaultColorizer(changes with velocity). You can easily create new ones by creating a class that conforms to the Colorizer protocol.
 - **Start delay**: Initial delay to show the text.
 - **Fade time**: Time to show/hide the text or entities on scene transitions.
 
 - Note: Created by *Rodrigo Longhi Guimarães*. This playground is meant to be used in XCode or in iPad Playgrounds.
 
 */
import SpriteKit

let scriptControllers: [ScriptController] = [
    SingleSentenceScriptController(text: "Hello, this is Me.",
                                   textAnimator: ShakeTextAnimator(),
                                   elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                   behaviourManager: DefaultBehaviourManager(),
                                   colorizer: DefaultColorizer(),
                                   startDelay: 1.0),
    SingleSentenceScriptController(text: "Yeah, I’m kind of chubby…",
                                   textAnimator: ScaleUpAndDownTextAnimator(minSize: 0.9, maxSize: 1.1, duration: 3),
                                   elementConfiguration: ElementConfiguration.justKeepOldElements,
                                   behaviourManager: DefaultBehaviourManager(),
                                   colorizer: DefaultColorizer()),
    SingleSentenceScriptController(text: "But I can jump, tap on the screen and you’ll see!",
                                   textAnimator: MoveUpAndDownTextAnimator(),
                                   elementConfiguration: ElementConfiguration.justKeepOldElements,
                                   behaviourManager: DefaultBehaviourManager(),
                                   colorizer: DefaultColorizer()),
    SingleSentenceScriptController(text: "That’s enough jumping… this is not a platform game.",
                                   textAnimator: EmptyTextAnimator(),
                                   elementConfiguration: ElementConfiguration.justKeepOldElements,
                                   behaviourManager: EmptyBehaviourManager(),
                                   colorizer: DefaultColorizer()),
    SingleSentenceScriptController(text: "This is a story about how me…",
                                   textAnimator: EmptyTextAnimator(),
                                   elementConfiguration: ElementConfiguration.justKeepOldElements,
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
                                   elementConfiguration: ElementConfiguration.dropAllElements,
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
                                   elementConfiguration: ElementConfiguration.justKeepOldElements,
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

//#-hidden-code
let script = Script.customScript(scriptControllers)
Launcher().start(with: script)
//#-end-hidden-code
