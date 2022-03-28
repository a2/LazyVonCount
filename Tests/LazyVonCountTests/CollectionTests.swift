import XCTest
@testable import LazyVonCount

final class CollectionTests: XCTestCase {
    var emptyCollection: LazyCount!
    var collectionOfOne: LazyCount!
    var emptyArray: LazyCount!
    var singleElementArray: LazyCount!
    var otherArray: LazyCount!

    override func setUp() {
        super.setUp()

        emptyCollection = EmptyCollection<Void>().lazyCount
        collectionOfOne = CollectionOfOne<Void>(()).lazyCount
        emptyArray = [Void]().lazyCount
        singleElementArray = [()].lazyCount
        otherArray = Array(repeating: (), count: 13).lazyCount
    }
    
    func testEqual() {
        XCTAssertEqual(emptyCollection, emptyCollection)
        XCTAssertEqual(emptyCollection, emptyArray)
        XCTAssertEqual(emptyArray, emptyCollection)

        XCTAssertTrue(emptyCollection == emptyCollection)
        XCTAssertTrue(emptyCollection == emptyArray)
        XCTAssertTrue(emptyArray == emptyCollection)

        XCTAssertFalse(emptyCollection == collectionOfOne)
        XCTAssertFalse(collectionOfOne == emptyCollection)
        XCTAssertFalse(emptyCollection == singleElementArray)
        XCTAssertFalse(singleElementArray == emptyCollection)
    }

    func testNotEqual() {
        XCTAssertNotEqual(emptyCollection, collectionOfOne)
        XCTAssertNotEqual(collectionOfOne, otherArray)
        XCTAssertNotEqual(otherArray, singleElementArray)

        XCTAssertTrue(emptyCollection != collectionOfOne)
        XCTAssertTrue(collectionOfOne != emptyCollection)
        XCTAssertTrue(emptyCollection != singleElementArray)
        XCTAssertTrue(singleElementArray != emptyCollection)

        XCTAssertFalse(emptyCollection != emptyCollection)
        XCTAssertFalse(emptyCollection != emptyArray)
        XCTAssertFalse(emptyArray != emptyCollection)
    }

    func testGreaterThan() {
        XCTAssertGreaterThan(collectionOfOne, emptyCollection)
        XCTAssertGreaterThan(singleElementArray, emptyCollection)
        XCTAssertGreaterThan(otherArray, singleElementArray)
        XCTAssertGreaterThan(otherArray, collectionOfOne)
    }

    func testGreaterThanOrEqual() {
        XCTAssertGreaterThanOrEqual(collectionOfOne, singleElementArray)
        XCTAssertGreaterThanOrEqual(emptyArray, emptyCollection)
        XCTAssertGreaterThanOrEqual(collectionOfOne, emptyCollection)
        XCTAssertGreaterThanOrEqual(singleElementArray, emptyCollection)
        XCTAssertGreaterThanOrEqual(otherArray, singleElementArray)
        XCTAssertGreaterThanOrEqual(otherArray, collectionOfOne)
    }

    func testLessThan() {
        XCTAssertLessThan(singleElementArray, otherArray)
        XCTAssertLessThan(emptyCollection, singleElementArray)
        XCTAssertLessThan(emptyCollection, collectionOfOne)
        XCTAssertLessThan(emptyCollection, singleElementArray)
        XCTAssertLessThan(singleElementArray, otherArray)
        XCTAssertLessThan(collectionOfOne, otherArray)

    }

    func testLessThanOrEqual() {
        XCTAssertLessThanOrEqual(emptyCollection, collectionOfOne)
        XCTAssertLessThanOrEqual(emptyCollection, singleElementArray)
        XCTAssertLessThanOrEqual(singleElementArray, otherArray)
        XCTAssertLessThanOrEqual(collectionOfOne, otherArray)
    }
}
