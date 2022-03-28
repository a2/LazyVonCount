extension Collection {
    public var lazyCount: LazyCount { LazyCount(self) }
}

extension RandomAccessCollection {
    public var lazyCount: LazyCount { LazyCount(self) }
}
