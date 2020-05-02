public struct SHA256DigestPolyfill  :Sequence {
    public typealias Iterator = IndexingIterator<[UInt8]>

    public var digest :[UInt8]
    
    public func makeIterator() -> SHA256DigestPolyfill.Iterator {
        return self.digest.makeIterator()
    }
}
