@testable import Calculator
import XCTest

class CalculatorTests: XCTestCase {

    func testInputEmpty_ItReturns0() {
        let displayResult = calculate(input: [])
        XCTAssertEqual(displayResult, Result(reducedInput: [], displayValue: "0"))
    }
    
    func testInput2_ItReturns2() {
        let displayResult = calculate(input: ["2"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["2"], displayValue: "2"))
    }
    
    func testInput7_ItReturns7() {
        let displayResult = calculate(input: ["7"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["7"], displayValue: "7"))
    }
    
    func testInput23_ItReturns23() {
        let displayResult = calculate(input: ["2", "3"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["2", "3"], displayValue: "23"))
    }
    
    func testInput9782_ItReturns9782() {
        let displayResult = calculate(input: ["9", "7", "8", "2"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["9", "7", "8", "2"], displayValue: "9782"))
    }
    
    func testInput2Plus_ItReturns2() {
        let displayResult = calculate(input: ["2", "+"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["2", "+"], displayValue: "2"))
    }
    
    func testInput5Minus_ItReturns5() {
        let displayResult = calculate(input: ["5", "-"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["5", "-"], displayValue: "5"))
    }
    
    func testInput7Multiply_ItReturns7() {
        let displayResult = calculate(input: ["7", "*"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["7", "*"], displayValue: "7"))
    }
    
    func testInput9Divide_ItReturns9() {
        let displayResult = calculate(input: ["9", "/"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["9", "/"], displayValue: "9"))
    }
    
    func testInput2Plus3_ItReturns3() {
        let displayResult = calculate(input: ["2", "+", "3"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["2", "+", "3"], displayValue: "3"))
    }
    
    func testInput1Plus47_ItReturns47() {
        let displayResult = calculate(input: ["1", "+", "4", "7"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["1", "+", "4", "7"], displayValue: "47"))
    }
    
    func testInput35Minus19_ItReturns19() {
        let displayResult = calculate(input: ["3", "5", "-", "1", "9"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["3", "5", "-", "1", "9"], displayValue: "19"))
    }
    
    func testInput10Multiply3_ItReturns3() {
        let displayResult = calculate(input: ["1", "0", "*", "3"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["1", "0", "*", "3"], displayValue: "3"))
    }
    
    func testInput999Divide111_ItReturns111() {
        let displayResult = calculate(input: ["9", "9", "/", "1", "1", "1"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["9", "9", "/", "1", "1", "1"], displayValue: "111"))
    }
    
    func testInput1Plus2Minus_ItReturns3() {
        let displayResult = calculate(input: ["1", "+", "2", "-"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["3", "-"], displayValue: "3"))
    }
    
    func testInput71Plus23Minus_ItReturns48() {
        let displayResult = calculate(input: ["7", "1", "-", "2", "3", "/"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["48", "/"], displayValue: "48"))
    }
    
    func testInput4Multiply6Multiply_ItReturns24() {
        let displayResult = calculate(input: ["4", "*", "6", "*"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["24", "*"], displayValue: "24"))
    }
    
    func testInput27Divide3Plus_ItReturns9() {
        let displayResult = calculate(input: ["2", "7", "/", "3", "+"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["9", "+"], displayValue: "9"))
    }
    
    func testInput9PlusMinus_ItReturns9() {
        let displayResult = calculate(input: ["9", "+", "-"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["9", "-"], displayValue: "9"))
    }
    
    func testInput4DivideMinusMultiplyPlus_ItReturns4() {
        let displayResult = calculate(input: ["4", "/", "-", "*", "+"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["4", "+"], displayValue: "4"))
    }
    
    func testInput1Divide2Equals_ItReturns0_5() {
        let displayResult = calculate(input: ["1", "/", "2", "="])
        XCTAssertEqual(displayResult, Result(reducedInput: ["0.5"], displayValue: "0.5"))
    }
    
    func testInput5Equals2_ItReturns2() {
        let displayResult = calculate(input: ["5", "=", "2"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["2"], displayValue: "2"))
    }
    
    func testInput7Equals3Plus_ItReturns3() {
        let displayResult = calculate(input: ["7", "=", "3", "+"])
        XCTAssertEqual(displayResult, Result(reducedInput: ["3", "+"], displayValue: "3"))
    }
    
    func testInput8Equals5Equals_ItReturns5() {
        let displayResult = calculate(input: ["8", "=", "5", "="])
        XCTAssertEqual(displayResult, Result(reducedInput: ["5"], displayValue: "5"))
    }
    
    func testInput0_24Plus1Equals_ItReturns1_24() {
        let displayResult = calculate(input: ["0", ".", "2", "4", "+", "1", "="])
        XCTAssertEqual(displayResult, Result(reducedInput: ["1.24"], displayValue: "1.24"))
    }

}
