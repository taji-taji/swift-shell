import XCTest
@testable import ShellExecutor

final class ShellExecutorTests: XCTestCase {
    private var shell: ShellExecutor!

    override func setUp() {
        super.setUp()

        shell = ShellExecutor()
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

    func testThrowsWhenInvalidCommandCalled() throws {
        XCTAssertThrowsError(try shell("taji-taji/swift-shell-executor/invalid-command"))
    }
}
