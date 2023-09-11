@testable import Calculator
import XCTest

class CalculatorViewControllerTests: XCTestCase {
    
    var sut: CalculatorViewController!

    override func setUp() {
        super.setUp()
        sut = CalculatorViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenViewIsLoaded_ItDisplaysZero() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedOn1_ItDisplays1() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "1")
        
        XCTAssertEqual(sut.displayLabel?.text, "1")
    }
    
    func testWhenTappedOn11_ItDisplays11() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "1")
        
        XCTAssertEqual(sut.displayLabel?.text, "11")
    }
    
    func testWhenTappedOn21_ItDisplays21() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "1")
        
        XCTAssertEqual(sut.displayLabel?.text, "21")
    }
    
    func testWhenTappedOn312_ItDisplays312() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "312")
    }
    
    func testWhenTappedOn444_ItsDisplays444() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "4")
        
        XCTAssertEqual(sut.displayLabel?.text, "444")
    }
    
    func testWhenTappedOn514_ItDisplays514() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "4")
        
        XCTAssertEqual(sut.displayLabel?.text, "514")
    }
    
    func testWhenTappedOn632_ItDisplays632() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "6")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "632")
    }
    
    func testWhenTappedOn747_ItDisplays747() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "7")
        
        XCTAssertEqual(sut.displayLabel?.text, "747")
    }
    
    func testWhenTappedOn856_ItDisplays856() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: "6")
        
        XCTAssertEqual(sut.displayLabel?.text, "856")
    }
    
    func testWhenTappedOn973_ItDisplays973() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "9")
        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "3")
        
        XCTAssertEqual(sut.displayLabel?.text, "973")
    }
    
    func testWhenTappedOn0_ItDisplays0() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "0")

        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedOn10_ItDisplays10() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "0")

        XCTAssertEqual(sut.displayLabel?.text, "10")
    }
    
    func testWhenTappedOn00_ItDisplays0() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "0")
        try sut.simulateTapOnButton(withTitle: "0")

        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedOnDot_ItDisplays0Dot() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: ".")
        
        XCTAssertEqual(sut.displayLabel?.text, "0.")
    }
    
    func testWhenTappedOnDot9_ItDisplays0Dot9() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "9")
        
        XCTAssertEqual(sut.displayLabel?.text, "0.9")
    }
    
    func testWhenTappedOn5Dot2_ItDisplays5Dot2() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "5.2")
    }
    
    func testWhenTappedOn1Plus2_ItDisplays2() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "+")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "2")
    }
    
    func testWhenTappedOn7Minus3Plus_ItDisplays4() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "+")

        XCTAssertEqual(sut.displayLabel?.text, "4")
    }
    
    func testWhenTappedOnMultiply8Minus_ItDisplays0() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "×")
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "−")
        
        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedOnSixDivideTwoAndMultiply_ItDisplays3() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "6")
        try sut.simulateTapOnButton(withTitle: "÷")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "×")
        
        XCTAssertEqual(sut.displayLabel?.text, "3")
    }
    
    func testWhenTappedOn8Minus3Equal_ItDisplays5() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "=")
        
        XCTAssertEqual(sut.displayLabel?.text, "5")
    }
    
    func testWhenTappedOn5DotMinus_ItDisplays5Dot() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "−")

        XCTAssertEqual(sut.displayLabel?.text, "5.")
    }
    
    func testWhenTappedOn5DotMinus3_ItDisplays3() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "3")

        XCTAssertEqual(sut.displayLabel?.text, "3")
    }
    
    func testWhenTappedOn123Clear_ItDisplays0() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "AC")
        
        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedOn987Removed_ItDisplays98() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "9")
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "98")
    }
    
    func testWhenTappedOn42MinusRemove_ItDisplays42() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "42")
    }
    
    func testWhenTappedOn42Minus1Remove_ItDisplays42() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "42")
    }
    
    func testWhenTappedOn42Minus16Remove_ItDisplays1() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "6")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "1")
    }
    
    func testWhenTappedOn7Dot2Dot_ItDisplays7Dot2() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: ".")

        XCTAssertEqual(sut.displayLabel?.text, "7.2")
    }
    
    func testWhenTappedOn7Dot2Dot3Dot5_ItDisplays7Dot235() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "5")

        XCTAssertEqual(sut.displayLabel?.text, "7.235")
    }

}

private extension CalculatorViewController {
    
    var displayLabel: UILabel? {
        view
            .recursiveSubviews
            .compactMap { view in view as? UILabel }
            .first
    }
    
    func simulateTapOnButton(withTitle title: String) throws {
        let button = try XCTUnwrap(findButton(withTitle: title))
        
        button.simulateTap()
    }
    
    // MARK: - Private
    
    private func findButton(withTitle title: String) -> UIButton? {
        view
            .recursiveSubviews
            .compactMap { view in view as? UIButton }
            .first { button in button.title(for: .normal) == title }
    }
    
}

private extension UIButton {
    
    func simulateTap() {
        sendActions(for: .touchUpInside)
    }
    
}

private extension UIView {
    
    var recursiveSubviews: [UIView] {
        subviews + subviews.flatMap(\.recursiveSubviews)
    }
    
}
