enum Command: String {
    case unlock = "unlock"
    case lock = "lock"

    init?(commandString: String) {
        if commandString.contains("unlock") {
            self = .unlock
        } else if commandString.contains("lock") {
            self = .lock
        }
        return nil
    }

    static func AllCommands() -> [String] {
        let commands: [Command] = [.unlock, .lock]
        let results: [String] = commands.map { $0.rawValue }
        return results
    }
}
