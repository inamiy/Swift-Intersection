import Foundation

extension Intersection: Decodable where Value1: Decodable, Value2: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value1 = try container.decode(Value1.self)
        self.value2 = try container.decode(Value2.self)
    }
}
