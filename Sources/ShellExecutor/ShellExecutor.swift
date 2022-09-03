import Foundation

public struct ShellExecutor {
    public init() {}

    @discardableResult
    public func callAsFunction(_ command: String,
                               arguments: [String] = [],
                               additionalEnvironment: [String: String] = [:]) throws -> String {
        let script = "\(command) \(arguments.joined(separator: " "))"

        let env = ProcessInfo.processInfo.environment
                             .merging(additionalEnvironment, uniquingKeysWith: { $1 })
        let task = Process()

        task.launchPath = "/bin/sh"
        task.arguments = ["-c", script]
        task.environment = env

        let outputPipe = Pipe()
        let errorPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardError = errorPipe
        task.launch()
        task.waitUntilExit()

        let outputMessage = String(data: outputPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)?.trimmingCharacters(in: .newlines)
        let errorMessage = String(data: errorPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)?.trimmingCharacters(in: .newlines)

        let status = task.terminationStatus
        if status == 0 {
            return outputMessage!
        } else {
            throw ShellExecutorError(exitStatus: status, description: errorMessage!)
        }
    }
}
