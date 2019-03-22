import Foundation

struct ScriptConstants {
    private init() {}
    
    static let defaultScript: [ScriptController] = [
        SingleSentenceScriptController(text: "Hello, this is Me.",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        SingleSentenceScriptController(text: "Yeah, I’m kind of chubby…",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true)),
        SingleSentenceScriptController(text: "But I can jump, tap on the screen and you’ll see!",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true)),
        SingleSentenceScriptController(text: "That’s enough jumping… this is not a platform game.",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: true),
                                       behaviourManager: EmptyBehaviourManager()),
        SingleSentenceScriptController(text: "This is a story about how me…",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 0, bodySize: 11.0, memberSize: 7.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager()),
        SingleSentenceScriptController(text: "…and a good friend…",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 11.0, memberSize: 7.0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager()),
        SingleSentenceScriptController(text: "overcame a big challenge!",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 50.0, memberSize: 0, keepToNextGeneration: true),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        ]
}
