import XCTest
import Intersection

final class IntersectionTests: XCTestCase {
    func testIntersection() {
        let intersection = Intersection(S1(1), S2(true))
        let intersection2 = Intersection(S1(1), S2(true))

        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)

        // Hashable compile test
        XCTAssertEqual(intersection, intersection2)
        XCTAssertEqual(intersection.hashValue, intersection2.hashValue)
    }

    func testIntersection3() {
        let intersection = Intersection3(S1(1), S2(true), S3(""))
        let intersection2 = Intersection3(S1(1), S2(true), S3(""))

        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, "")

        // Hashable compile test
        XCTAssertEqual(intersection, intersection2)
        XCTAssertEqual(intersection.hashValue, intersection2.hashValue)
    }

    func testIntersection4() {
        let intersection = Intersection4(S1(1), S2(true), S3(""), S4(0.1))
        let intersection2 = Intersection4(S1(1), S2(true), S3(""), S4(0.1))

        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, "")
        XCTAssertEqual(intersection.value4, 0.1)

        // Hashable compile test
        XCTAssertEqual(intersection, intersection2)
        XCTAssertEqual(intersection.hashValue, intersection2.hashValue)
    }

    func testIntersection5() {
        let intersection = Intersection5(S1(1), S2(true), S3(""), S4(0.1), S5(0))
        let intersection2 = Intersection5(S1(1), S2(true), S3(""), S4(0.1), S5(0))

        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, "")
        XCTAssertEqual(intersection.value4, 0.1)
        XCTAssertEqual(intersection.value5, 0)

        // Hashable compile test
        XCTAssertEqual(intersection, intersection2)
        XCTAssertEqual(intersection.hashValue, intersection2.hashValue)
    }

    static var allTests = [
        ("testIntersection", testIntersection),
        ("testIntersection3", testIntersection3),
        ("testIntersection4", testIntersection4),
        ("testIntersection5", testIntersection5),
    ]
}

// MARK: - Fixtures

private struct S1: Hashable {
    var value1: Int
    init(_ value: Int) { self.value1 = value }
}

private struct S2: Hashable {
    var value2: Bool
    init(_ value: Bool) { self.value2 = value }
}

private struct S3: Hashable {
    var value3: String
    init(_ value: String) { self.value3 = value }
}

private struct S4: Hashable {
    var value4: Float
    init(_ value: Float) { self.value4 = value }
}

private struct S5: Hashable {
    var value5: UInt8
    init(_ value: UInt8) { self.value5 = value }
}
