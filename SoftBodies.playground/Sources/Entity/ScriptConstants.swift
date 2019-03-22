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
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: false),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        SingleSentenceScriptController(text: "But I can jump, tap on the screen and you’ll see! — (color changes with jump)",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: false),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        SingleSentenceScriptController(text: "That’s enough jumping… this is not a platform game.",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: false),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        SingleSentenceScriptController(text: "That’s enough jumping… this is not a platform game.",
                                       elementConfiguration: ElementConfiguration(numberOfElements: 1, bodySize: 15.0, memberSize: 9.0, keepToNextGeneration: false),
                                       behaviourManager: DefaultBehaviourManager(),
                                       colorizer: DefaultColorizer(),
                                       startDelay: 1.0),
        ]
}
