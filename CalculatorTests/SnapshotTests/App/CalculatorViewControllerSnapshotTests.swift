@testable import Calculator
import SnapshotTesting
import XCTest

class CalculatorViewControllerSnapshotTests: XCTestCase {
    
    var sut: CalculatorViewController!

    override func setUp() {
        super.setUp()
        sut = CalculatorViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testCalculatorViewControllerHasCorrectLayout() {
        let size = ViewImageConfig.iPhoneX.size.unsafelyUnwrapped
        assertSnapshot(matching: sut, as: .image(size: size), record: false)
    }

}
