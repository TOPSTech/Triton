##Triton

This is a simple, untested (Quick doesn't do Swift 3 yet) proof of concept that you can use Siri to send commands to arbitrary services (in this proof of concept, a connected car). The backend itself is mocked out (I spent about 8 months in the past year working on a connected car app at work, on a team of 40+ people. This is not something that 1 person can do over the course of a night).

Simply install this on an iOS 10 device, enable for siri (launch the app? I don't have the iOS 10 beta on any of my devices as of this writing), and say something like "siri, use Triton to tell my car to lock" or "siri, use Triton to tell my car to unlock".

####How does it work?

This works by pretending to be a Messaging app to Siri, and trying to interpret the result (a future iteration of this might integrate with [Wit.ai](https://wit.ai) for interpretting the string that Siri gives us) upon a set of supported commands (as of now, Lock and Unlock).

I am fairly certain that this would get rejected from apple, because it's not actually a messaging app (Technically, it's just having a conversation with whatever device it's controlling).