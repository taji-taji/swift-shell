import Foundation

public struct ShellError: Error, CustomStringConvertible {
    public let exitStatus: Int32
    public let description: String
}
