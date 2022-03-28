enum CollectionAccess {
    case linear(count: () -> Int, baseIndex: () -> Any, offsetIndex: (Any, Int) -> Any?)
    case random(count: () -> Int)

    init<Base>(_ base: Base) where Base: Collection {
        self = .linear {
            base.count
        } baseIndex: {
            base.startIndex
        } offsetIndex: { index, offset in
            base.index(index as! Base.Index, offsetBy: offset, limitedBy: base.endIndex)
        }
    }

    init<Base>(_ base: Base) where Base: RandomAccessCollection {
        self = .random { base.count }
    }

    var count: Int {
        switch self {
        case .linear(let count, _, _):
            return count()
        case .random(let count):
            return count()
        }
    }
}
