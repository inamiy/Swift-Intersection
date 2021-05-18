import XCTest
import Intersection

final class DecodableTests: XCTestCase {
    func testDecodable() throws {
        let json = """
            {
                "value1": 1,
                "value2": true
            }
            """
        let intersection = try JSONDecoder().decode(Intersection<S1, S2>.self, from: json.data(using: .utf8)!)
        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
    }

    func testDecodable2() throws {
        let json = """
            {
                "value1": 1,
                "value2": true,
                "value3": {
                    "value1": 2
                }
            }
            """
        let intersection = try JSONDecoder().decode(Intersection3<S1, S2, S3>.self, from: json.data(using: .utf8)!)
        XCTAssertEqual(intersection.value1, 1)
        XCTAssertEqual(intersection.value2, true)
        XCTAssertEqual(intersection.value3, S1(2))
    }

    static var allTests = [
        ("testDecodable", testDecodable),
        ("testDecodable2", testDecodable2)
    ]
}

// MARK: - Fixtures

private struct S1: Decodable, Equatable {
    var value1: Int
    init(_ value: Int) { self.value1 = value }
}

private struct S2: Decodable, Equatable {
    var value2: Bool
    init(_ value: Bool) { self.value2 = value }
}

private struct S3: Decodable, Equatable {
    var value3: S1
    init(_ value: S1) { self.value3 = value }
}
