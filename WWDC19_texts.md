# Tell us about the features and technologies you used in your Swift playground.

StoryOMatic is a passion project, and I feel like it really represents who I am. The ethos of it is to allow people to tell impactful stories with minimalistic interactive physics-based scenes.

Telling your own story is as simple as writing down a list of configurations for each of your scenes. Each scene is represented by a ScriptController, which draws all the elements of that scene and also notify (using the delegate pattern) the completion of the current script.

The technologies are pretty standard in what concerns iOS development: a full-screen Sprite Kit View (SKView) is shown and some UIKit elements (labels, for example) are rendered over it.

I began working professionally with iOS last year, and I really focused on learning design patterns and principles that would make my software easy to understand, extend and maintain. Primarily, I've been studying Robert Martin's Clean Code and Clean Architecture, and also the SOLID principles. Despite the short time to create this piece of software, I tried to apply some of these concepts I learned, and I'm proud to present a solution where the entities coloring techniques, their movement and behavior, and more can be extended by simply implementing a protocol. Moreover, these different behaviors can be injected dependencies with a standard interface, acting as a plugin to the main application.

Lastly, StoryOMatic comes with a heartfelt demonstration story, and I really hope you enjoy it. Life can be tough sometimes, and giving up of something makes you feel like you are worthless. However, be sure to keep strong and new challenges along the way will be there for you to prove your value.