public func < (_ lhs: LazyCount, _ rhs: Int) -> Bool { lhs < LazyCount(rhs) }

public func < (_ lhs: Int, _ rhs: LazyCount) -> Bool { LazyCount(lhs) < rhs }

public func <= (_ lhs: LazyCount, _ rhs: Int) -> Bool { lhs <= LazyCount(rhs) }

public func <= (_ lhs: Int, _ rhs: LazyCount) -> Bool { LazyCount(lhs) <= rhs }

public func > (_ lhs: LazyCount, _ rhs: Int) -> Bool { lhs > LazyCount(rhs) }

public func > (_ lhs: Int, _ rhs: LazyCount) -> Bool { LazyCount(lhs) > rhs }

public func >= (_ lhs: LazyCount, _ rhs: Int) -> Bool { lhs >= LazyCount(rhs) }

public func >= (_ lhs: Int, _ rhs: LazyCount) -> Bool { LazyCount(lhs) >= rhs }
