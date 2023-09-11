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
    
    func testWhenTappedOnOne_ItDisplaysOne() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "1")
        
        XCTAssertEqual(sut.displayLabel?.text, "1")
    }
    
    func testWhenTappedOnOneTwice_ItDisplaysEleven() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "1")
        
        XCTAssertEqual(sut.displayLabel?.text, "11")
    }
    
    func testWhenTappedOnTwoAndOne_ItDisplaysTwentyOne() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "1")
        
        XCTAssertEqual(sut.displayLabel?.text, "21")
    }
    
    func testWhenTappedOnThreeOneAndTwo_ItDisplaysThreeHundredTwelve() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "312")
    }
    
    func testWhenTappedOnFourFourFour_ItsDisplaysFourHundredFortyFour() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "4")
        
        XCTAssertEqual(sut.displayLabel?.text, "444")
    }
    
    func testWhenTappedFiveOneAndFour_ItDisplaysFiveHundredFourteen() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "4")
        
        XCTAssertEqual(sut.displayLabel?.text, "514")
    }
    
    func testWhenTappedSixThreeAndTwo_ItDisplaysSixHundredThirtyTwo() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "6")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "632")
    }
    
    func testWhenTappedSevenFourAndSeven_ItDisplaysSevenHundredFourtySeven() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "7")
        
        XCTAssertEqual(sut.displayLabel?.text, "747")
    }
    
    func testWhenTappedEightFiveAndSix_ItDisplaysEightHundredFiftySix() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: "6")
        
        XCTAssertEqual(sut.displayLabel?.text, "856")
    }
    
    func testWhenTappedNineSevenAndThree_ItDisplaysNineHundredSeventyThree() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "9")
        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "3")
        
        XCTAssertEqual(sut.displayLabel?.text, "973")
    }
    
    func testWhenTappedZero_ItDisplaysZero() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "0")

        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedOneAndZero_ItDisplaysTen() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "0")

        XCTAssertEqual(sut.displayLabel?.text, "10")
    }
    
    func testWhenTappedZeroTwice_ItDisplaysZero() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "0")
        try sut.simulateTapOnButton(withTitle: "0")

        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedDot_ItDisplaysZeroDot() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: ".")
        
        XCTAssertEqual(sut.displayLabel?.text, "0.")
    }
    
    func testWhenTappedDotAndNine_ItDisplaysZeroDotNine() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "9")
        
        XCTAssertEqual(sut.displayLabel?.text, "0.9")
    }
    
    func testWhenTappedFiveDotTwo_ItDisplaysFiveDotTwo() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "5.2")
    }
    
    func testWhenTappedOneAndPlus_ItDisplaysOne() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "+")
        try sut.simulateTapOnButton(withTitle: "2")
        
        XCTAssertEqual(sut.displayLabel?.text, "2")
    }
    
    func testWhenTappedSevenMinusThreeAndEquals_ItDisplaysFour() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "+")

        XCTAssertEqual(sut.displayLabel?.text, "4")
    }
    
    func testWhenTappedMultiplyEightAndMinus_ItDisplaysZero() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "×")
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "−")
        
        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedSixDivideTwoAndMultiply_ItDisplaysThree() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "6")
        try sut.simulateTapOnButton(withTitle: "÷")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "×")
        
        XCTAssertEqual(sut.displayLabel?.text, "3")
    }
    
    func testWhenTappedEightMinusThreeAndEqual_ItDisplaysFive() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "=")
        
        XCTAssertEqual(sut.displayLabel?.text, "5")
    }
    
    func testWhenTappedFiveDotAndMinus_ItDisplaysFiveDot() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "−")

        XCTAssertEqual(sut.displayLabel?.text, "5.")
    }
    
    func testWhenTappedFiveDotMinusAndThree_ItDisplaysThree() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "5")
        try sut.simulateTapOnButton(withTitle: ".")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "3")

        XCTAssertEqual(sut.displayLabel?.text, "3")
    }
    
    func testWhenTappedOneTwoThreeAndClear_ItDisplaysZero() throws {
        sut.loadViewIfNeeded()
        
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "3")
        try sut.simulateTapOnButton(withTitle: "AC")
        
        XCTAssertEqual(sut.displayLabel?.text, "0")
    }
    
    func testWhenTappedNineEightSevenAndRemoved_ItDisplaysNintyEight() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "9")
        try sut.simulateTapOnButton(withTitle: "8")
        try sut.simulateTapOnButton(withTitle: "7")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "98")
    }
    
    func testWhenTappedFourTwoMinusAndRemove_ItDisplaysFortyTwo() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "42")
    }
    
    func testWhenTappedFourTwoMinusOneAndRemove_ItDisplaysFortyTwo() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "42")
    }
    
    func testWhenTappedFourTwoMinusOneSixAndRemove_ItDisplaysOne() throws {
        sut.loadViewIfNeeded()

        try sut.simulateTapOnButton(withTitle: "4")
        try sut.simulateTapOnButton(withTitle: "2")
        try sut.simulateTapOnButton(withTitle: "−")
        try sut.simulateTapOnButton(withTitle: "1")
        try sut.simulateTapOnButton(withTitle: "6")
        try sut.simulateTapOnButton(withTitle: "⌫")

        XCTAssertEqual(sut.displayLabel?.text, "1")
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
