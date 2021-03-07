public protocol _ExtensibleStruct {
    associatedtype Value
    associatedtype Other

    init(_ value: Value, _ other: Other)
}

@dynamicMemberLookup
public struct ExtensibleStruct<Value, Other>: _ExtensibleStruct {
    var value: Value
    var other: Other

    public init(_ value: Value, _ other: Other) {
        self.value = value
        self.other = other
    }

    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> T {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }

    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Other, T>) -> T {
        get { other[keyPath: keyPath] }
        set { other[keyPath: keyPath] = newValue }
    }
}

extension ExtensibleStruct where Other: _ExtensibleStruct, Other.Other == Void {
    public init(_ value: Value, _ other: Other.Value) {
        self.value = value
        self.other = .init(other, ())
    }
}

extension ExtensibleStruct where Other: _ExtensibleStruct, Other.Other: _ExtensibleStruct, Other.Other.Other == Void {
    public init(_ value: Value, _ other: Other.Value, _ other2: Other.Other.Value) {
        self.value = value
        self.other = .init(other, .init(other2, ()))
    }
}

public typealias Intersection<T1, T2> = ExtensibleStruct<T1, ExtensibleStruct<T2, Void>>
public typealias Intersection3<T1, T2, T3> = ExtensibleStruct<T1, Intersection<T2, T3>>
