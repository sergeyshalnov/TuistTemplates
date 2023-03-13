import XCTest
@testable import Common

final class CommonTests: XCTestCase {
    func test_barReturns2() {
        // given
        let result = 2

        // when
        let bar = Common.bar()

        // then
        XCAssertEqual(bar, result)
    }
}