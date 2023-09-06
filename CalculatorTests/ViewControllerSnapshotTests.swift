@testable import Calculator
import SnapshotTesting
import XCTest

class ViewControllerSnapshotTests: XCTestCase {
    
    var sut: ViewController!

    override func setUp() {
        super.setUp()
        sut = ViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testViewControllerHasCorrectLayout() {
        assertSnapshot(matching: sut, as: .image, record: false)
    }

}
