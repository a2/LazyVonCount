public struct LazyCount {
    enum Storage {
        case collection(CollectionAccess)
        case literal(Int)
    }

    let storage: Storage

    public init<Base>(_ base: Base) where Base: Collection {
        storage = .collection(CollectionAccess(base))
    }

    public init<Base>(_ base: Base) where Base: RandomAccessCollection {
        storage = .collection(CollectionAccess(base))
    }

    public init(_ value: Int) {
        storage = .literal(value)
    }

    public var value: Int {
        switch storage {
        case .collection(let base):
            return base.count
        case .literal(let value):
            return value
        }
    }
}

extension LazyCount: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

extension LazyCount: Equatable {
    public static func == (_ lhs: LazyCount, _ rhs: LazyCount) -> Bool {
        switch (lhs.storage, rhs.storage) {
        case (.collection(let left), .collection(let right)):
            // lhs.count == rhs.count
            return left.count == right.count

        case (.literal(let value), .collection(let base)), (.collection(let base), .literal(let value)):
            // base.count == #
            // # == base.count
            switch base {
            case .linear(_, let baseIndex, let offsetIndex):
                guard let index = offsetIndex(baseIndex(), value) else { return false }
                return offsetIndex(index, 1) == nil
            case .random(let count):
                return count() == value
            }

        case (.literal(let left), .literal(let right)):
            // lhs == rhs
            return left == right
        }
    }
}

extension LazyCount: Comparable {
    public static func < (_ lhs: LazyCount, _ rhs: LazyCount) -> Bool {
        switch (lhs.storage, rhs.storage) {
        case (.collection(let left), .collection(let right)):
            // lhs.count < rhs.count
            return left.count < right.count

        case (.collection(let base), .literal(let value)):
            // base.count < X [or] X > base.count

            // base.count is always non-negative (0 or greater)
            guard value > 0 else { return false }

            switch base {
            case .linear(_, let baseIndex, let offsetIndex):
                guard let index = offsetIndex(baseIndex(), value - 1) else { return true }
                return offsetIndex(index, 1) == nil
            case .random(let count):
                return count() < value
            }

        case (.literal(let value), .collection(let base)):
            // X < base.count [or] base.count > X

            // base.count is always non-negative (0 or greater)
            guard value > 0 else { return true }

            switch base {
            case .linear(_, let baseIndex, let offsetIndex):
                guard let index = offsetIndex(baseIndex(), value) else { return false }
                return offsetIndex(index, 1) != nil
            case .random(let count):
                return value < count()
            }

        case (.literal(let left), .literal(let right)):
            // lhs < rhs
            return left < right
        }
    }
}
