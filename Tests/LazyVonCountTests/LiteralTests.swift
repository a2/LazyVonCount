import XCTest
@testable import LazyVonCount

final class LiteralTests: XCTestCase {
    var sut: LazyCount!

    override func setUp() {
        super.setUp()
        
        sut = LazyCount(13)
    }

    func testValue() {
        XCTAssertNotEqual(sut.value, 0)
        XCTAssertGreaterThan(sut.value, 1)
        XCTAssertEqual(sut.value, 13)
        XCTAssertLessThan(sut.value, 69)
    }

    func testEqual() {
        XCTAssertEqual(sut, 13)
        XCTAssertEqual(13, sut)

        XCTAssertTrue(sut == 13)
        XCTAssertTrue(13 == sut)

        XCTAssertTrue(sut == Int(13))
        XCTAssertTrue(Int(13) == sut)

        XCTAssertFalse(sut == 69)
        XCTAssertFalse(69 == sut)

        XCTAssertFalse(sut == Int(69))
        XCTAssertFalse(Int(69) == sut)
    }

    func testNotEqual() {
        XCTAssertNotEqual(sut, 69)
        XCTAssertNotEqual(69, sut)

        XCTAssertTrue(sut != 69)
        XCTAssertTrue(69 != sut)

        XCTAssertTrue(sut != Int(69))
        XCTAssertTrue(Int(69) != sut)

        XCTAssertFalse(sut != 13)
        XCTAssertFalse(13 != sut)

        XCTAssertFalse(sut != Int(13))
        XCTAssertFalse(Int(13) != sut)
    }

    func testGreaterThan() {
        for i in 0 ..< 13 {
            XCTAssertGreaterThan(sut, LazyCount(i))
            XCTAssertTrue(sut > i)
        }

        XCTAssertTrue(sut > 12)
        XCTAssertTrue(sut > Int(12))

        XCTAssertTrue(15 > sut)
        XCTAssertTrue(Int(15) > sut)

        XCTAssertFalse(sut > 69)
        XCTAssertFalse(sut > Int(69))

        XCTAssertFalse(1 > sut)
        XCTAssertFalse(Int(1) > sut)
    }

    func testGreaterThanOrEqual() {
        for i in 0 ... 13 {
            XCTAssertGreaterThanOrEqual(sut, LazyCount(i))
            XCTAssertTrue(sut >= i)
        }

        XCTAssertTrue(sut >= 1)
        XCTAssertTrue(sut >= Int(1))

        XCTAssertTrue(sut >= 13)
        XCTAssertTrue(sut >= Int(13))

        XCTAssertFalse(sut >= 69)
        XCTAssertFalse(sut >= Int(69))

        XCTAssertFalse(1 >= sut)
        XCTAssertFalse(Int(1) >= sut)

        XCTAssertTrue(69 >= sut)
        XCTAssertTrue(Int(69) >= sut)
    }

    func testLessThan() {
        for i in 0 ..< 13 {
            XCTAssertTrue(i < sut)
            XCTAssertFalse(sut < i)
        }

        XCTAssertLessThan(sut, 69)

        XCTAssertTrue(sut < 69)
        XCTAssertTrue(sut < Int(69))

        XCTAssertTrue(1 < sut)
        XCTAssertTrue(Int(1) < sut)

        XCTAssertFalse(69 < sut)
        XCTAssertFalse(Int(69) < sut)
    }

    func testLessThanOrEqual() {
        for i in 0 ..< 13 {
            XCTAssertTrue(i <= sut)
            XCTAssertFalse(sut <= i)
        }

        XCTAssertLessThanOrEqual(sut, 69)

        XCTAssertFalse(sut <= 1)
        XCTAssertFalse(sut <= Int(1))

        XCTAssertTrue(sut <= 13)
        XCTAssertTrue(sut <= Int(13))

        XCTAssertTrue(sut <= 69)
        XCTAssertTrue(sut <= Int(69))

        XCTAssertTrue(1 <= sut)
        XCTAssertTrue(Int(1) <= sut)

        XCTAssertTrue(13 <= sut)
        XCTAssertTrue(Int(13) <= sut)

        XCTAssertFalse(69 <= sut)
        XCTAssertFalse(Int(69) <= sut)
    }
}
