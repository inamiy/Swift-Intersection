import XCTest
import ExtensibleStruct

final class ExtensibleStructTests: XCTestCase {
    func testIntersection() {
        let intersection = Intersection(S1(1), S2(true))
        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
    }

    func testIntersection3() {
        let intersection = Intersection3(S1(1), S2(true), S3(""))
        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, "")
    }

    static var allTests = [
        ("testIntersection", testIntersection),
        ("testIntersection3", testIntersection3),
    ]
}

// MARK: - Fixtures

struct S1 {
    var value1: Int
    init(_ value: Int) { self.value1 = value }
}

struct S2 {
    var value2: Bool
    init(_ value: Bool) { self.value2 = value }
}

struct S3 {
    var value3: String
    init(_ value: String) { self.value3 = value }
}
