import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SHA256PolyfillTests.allTests),
    ]
}
#endif
