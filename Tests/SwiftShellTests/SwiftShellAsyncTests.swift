import XCTest
@testable import SwiftShell

final class SwiftShellAsyncTests: XCTestCase {
    private var shell: Shell!

    override func setUp() {
        super.setUp()

        shell = Shell()
    }

    func testConcurrentSleep() async throws {
        let startDate = Date()
        async let first = shell("sleep 0.5")
        async let second = shell("sleep 0.5")
        async let third = shell("sleep 0.5")
        async let fourth = shell("sleep 0.5")

        let _ = try await (first, second, third, fourth)
        let endDate = Date()

        XCTAssertEqual(endDate.timeIntervalSince(startDate), 0.5, accuracy: 1)
    }
}
