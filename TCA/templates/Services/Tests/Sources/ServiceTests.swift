import XCTest
@testable import Services

final class ServiceTests: XCTestCase {
    func test_fooReturns2() {
        // given
        let result = 2

        // when
        let foo = Service.foo()

        // then
        XCAssertEqual(foo, result)
    }
}