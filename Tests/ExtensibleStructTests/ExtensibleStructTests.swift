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

    func testIntersection4() {
        let intersection = Intersection4(S1(1), S2(true), S3(""), S4(0.1))
        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, "")
        XCTAssertEqual(intersection.value4, 0.1)
    }

    func testIntersection5() {
        let intersection = Intersection5(S1(1), S2(true), S3(""), S4(0.1), S5(0))
        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, "")
        XCTAssertEqual(intersection.value4, 0.1)
        XCTAssertEqual(intersection.value5, 0)
    }

    static var allTests = [
        ("testIntersection", testIntersection),
        ("testIntersection3", testIntersection3),
        ("testIntersection4", testIntersection4),
        ("testIntersection5", testIntersection5),
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

struct S4 {
    var value4: Float
    init(_ value: Float) { self.value4 = value }
}

struct S5 {
    var value5: UInt8
    init(_ value: UInt8) { self.value5 = value }
}
