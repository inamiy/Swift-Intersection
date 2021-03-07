# ExtensibleStruct
Extensible records / intersection type in Swift.

```swift
struct S1 {
    var value1: Int
}

struct S2 {
    var value2: Bool
}

let intersection = Intersection(S1(1), S2(true))
XCTAssertEqual(intersection.value1, 1)
XCTAssertEqual(intersection.value2, true)

// `intersection` behaves as `S1 & S2` (intersection type in TypeScript)
```

See also https://twitter.com/inamiy/status/1368468757702569986 .
