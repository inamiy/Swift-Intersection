public protocol IntersectionProtocol {
    associatedtype Value1
    associatedtype Value2

    init(_ value1: Value1, _ value2: Value2)
}

@dynamicMemberLookup
public struct Intersection<Value1, Value2>: IntersectionProtocol {
    var value1: Value1
    var value2: Value2

    public init(_ value1: Value1, _ value2: Value2) {
        self.value1 = value1
        self.value2 = value2
    }

    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Value1, T>) -> T {
        get { value1[keyPath: keyPath] }
        set { value1[keyPath: keyPath] = newValue }
    }

    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Value2, T>) -> T {
        get { value2[keyPath: keyPath] }
        set { value2[keyPath: keyPath] = newValue }
    }
}

extension Intersection where Value2: IntersectionProtocol {
    public init(
        _ value1: Value1,
        _ value21: Value2.Value1,
        _ value22: Value2.Value2
    ) {
        self.value1 = value1
        self.value2 = .init(value21, value22)
    }
}

extension Intersection where Value2: IntersectionProtocol, Value2.Value2: IntersectionProtocol {
    public init(
        _ value1: Value1,
        _ value21: Value2.Value1,
        _ value221: Value2.Value2.Value1,
        _ value222: Value2.Value2.Value2
    ) {
        self.value1 = value1
        self.value2 = .init(value21, .init(value221, value222))
    }
}

extension Intersection where Value2: IntersectionProtocol, Value2.Value2: IntersectionProtocol,
                             Value2.Value2.Value2: IntersectionProtocol {
    public init(
        _ value1: Value1,
        _ value21: Value2.Value1,
        _ value221: Value2.Value2.Value1,
        _ value2221: Value2.Value2.Value2.Value1,
        _ value2222: Value2.Value2.Value2.Value2
    ) {
        self.value1 = value1
        self.value2 = .init(value21, .init(value221, .init(value2221, value2222)))
    }
}

public typealias Intersection3<T1, T2, T3> = Intersection<T1, Intersection<T2, T3>>
public typealias Intersection4<T1, T2, T3, T4> = Intersection3<T1, T2, Intersection<T3, T4>>
public typealias Intersection5<T1, T2, T3, T4, T5> = Intersection4<T1, T2, T3, Intersection<T4, T5>>

// MARK: - Equatable / Hashable

extension Intersection: Equatable where Value1: Equatable, Value2: Equatable {}
extension Intersection: Hashable where Value1: Hashable, Value2: Hashable {}
