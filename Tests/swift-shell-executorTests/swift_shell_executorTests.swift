import XCTest
@testable import swift_shell_executor

final class swift_shell_executorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_shell_executor().text, "Hello, World!")
    }
}
