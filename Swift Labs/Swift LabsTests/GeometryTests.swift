import XCTest
@testable import Swift_Labs

class GeometryTests: XCTestCase
{
    func testInitializePoint() {
        let point1 = Point(x: 3.0, y: 12.5)
        print(point1)
    }
}
