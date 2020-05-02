import MyUmbrella

import Foundation

struct SHA256Polyfill {
    public static func hash(data: Data) -> SHA256DigestPolyfill {
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes { bytes in
            _ = CC_SHA256(bytes.baseAddress, CC_LONG(data.count), &digest)
        }

        return SHA256DigestPolyfill(digest: digest)
    }
}
