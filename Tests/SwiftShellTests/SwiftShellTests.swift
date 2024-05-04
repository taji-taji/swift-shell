import XCTest
@testable import SwiftShell

final class SwiftShellTests: XCTestCase {
    private var shell: Shell!

    override func setUp() {
        super.setUp()

        shell = Shell()
    }

    func testPWD() throws {
        let result = try shell("pwd")
        XCTAssertEqual(result, FileManager.default.currentDirectoryPath)
    }

    func testAddEnv() throws {
        let result = try shell("echo",
                               arguments: ["$MYENV"],
                               additionalEnvironment: ["MYENV": "test"])
        XCTAssertEqual(result, "test")
    }

    func testLongOutput() throws {
        let longText = (1...100000).map { _ in "=" }.joined(separator: "")
        let result = try shell("echo '\(longText)'")
        XCTAssertEqual(result, longText)
    }

    func testThrowsWhenInvalidCommandCalled() throws {
        XCTAssertThrowsError(try shell("taji-taji/swift-shell/invalid-command"))
    }
}
