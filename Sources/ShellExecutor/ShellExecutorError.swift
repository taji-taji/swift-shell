import Foundation

public struct ShellExecutorError: Error, CustomStringConvertible {
    public let exitStatus: Int32
    public let description: String
}
