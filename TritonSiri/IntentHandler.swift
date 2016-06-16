import Intents
import TritonKit

class IntentHandler: INExtension, INSendMessageIntentHandling {

    private var module = TritonKitModule()
    lazy var lockCarUseCase: CarLockUseCase = {
        return self.module.carLockUseCase
    }()
    
    override func handler(for intent: INIntent) -> AnyObject {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }

    func resolveContent(forSendMessage intent: INSendMessageIntent, with completion: (INStringResolutionResult) -> Void) {
        if let content = intent.content {
            if let command = Command(commandString: content) {
                completion(INStringResolutionResult.success(with: command.rawValue))
            } else {
                completion(INStringResolutionResult.unsupported(with: .unknown, alternativeStrings: Command.AllCommands()))
            }
        } else {
            completion(INStringResolutionResult.unsupported(with: .unknown, alternativeStrings: Command.AllCommands()))
        }
    }

    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
        if let content = intent.content, command = Command(commandString: content) {
            switch command {
            case .unlock:
                self.lockCarUseCase.unlockMainCar { unlocked in
                    let code: INSendMessageIntentResponseCode
                    if unlocked {
                        code = .success
                    } else {
                        code = .failure
                    }
                    let response = INSendMessageIntentResponse(code: code, userActivity: nil)
                    completion(response)
                }
            case .lock:
                self.lockCarUseCase.lockMainCar { locked in
                    let code: INSendMessageIntentResponseCode
                    if locked {
                        code = .success
                    } else {
                        code = .failure
                    }
                    let response = INSendMessageIntentResponse(code: code, userActivity: nil)
                    completion(response)
                }
            }
        } else {
            let response = INSendMessageIntentResponse(code: .failure, userActivity: nil)
            completion(response)
        }
    }
}

