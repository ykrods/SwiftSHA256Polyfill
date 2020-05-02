import MyUmbrella

import Foundation

public struct SHA256DigestPolyfill: Sequence {
    public typealias Iterator = IndexingIterator<[UInt8]>

    public var digest: [UInt8]

    public func makeIterator() -> SHA256DigestPolyfill.Iterator {
        return self.digest.makeIterator()
    }
}

public struct SHA256Polyfill {
    public static func hash(data: Data) -> SHA256DigestPolyfill {

        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes { bytes in
            _ = CC_SHA256(bytes.baseAddress, CC_LONG(data.count), &digest)
        }

        return SHA256DigestPolyfill(digest: digest)
    }
}
