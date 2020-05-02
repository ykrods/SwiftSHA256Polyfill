import XCTest

@testable import SHA256Polyfill

import CryptoKit

final class SHA256PolyfillTests: XCTestCase {
    let expected = [
        "": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        "Foo": "2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae"
    ]
    
    func testHash() {
        var digest = SHA256Polyfill.hash(data: "foo".data(using: .utf8)!)
        var hashStr = digest.compactMap { String(format: "%02x", $0) }.joined()
        
        XCTAssertEqual(hashStr, expected["Foo"])
        
        digest = SHA256Polyfill.hash(data: "".data(using: .utf8)!)
        hashStr = digest.compactMap { String(format: "%02x", $0) }.joined()
        XCTAssertEqual(hashStr, expected[""])
    }

    // For checking CryptKit behavior
    func testiOS13SHA256() {
        if #available(iOS 13.0, *) {
            let digest :SHA256Digest = SHA256.hash(data: "foo".data(using: .utf8)!)
            let hashStr = digest.compactMap { String(format: "%02x", $0) }.joined()
            XCTAssertEqual(hashStr, expected["Foo"])
        }
    }
    
    static var allTests = [
        ("testHash", testHash),
        ("testiOS13SHA256", testiOS13SHA256)
    ]
}
