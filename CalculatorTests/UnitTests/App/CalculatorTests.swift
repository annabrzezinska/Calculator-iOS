@testable import Calculator
import XCTest

class CalculatorTests: XCTestCase {

    func testInputEmpty_ItReturns0() {
        let displayResult = calculate(input: [])
        XCTAssertEqual(displayResult, State(reducedInput: [], displayValue: "0"))
    }
    
    func testInput2_ItReturns2() {
        let displayResult = calculate(input: ["2"])
        XCTAssertEqual(displayResult, State(reducedInput: ["2"], displayValue: "2"))
    }
    
    func testInput7_ItReturns7() {
        let displayResult = calculate(input: ["7"])
        XCTAssertEqual(displayResult, State(reducedInput: ["7"], displayValue: "7"))
    }
    
    func testInput23_ItReturns23() {
        let displayResult = calculate(input: ["2", "3"])
        XCTAssertEqual(displayResult, State(reducedInput: ["2", "3"], displayValue: "23"))
    }
    
    func testInput9782_ItReturns9782() {
        let displayResult = calculate(input: ["9", "7", "8", "2"])
        XCTAssertEqual(displayResult, State(reducedInput: ["9", "7", "8", "2"], displayValue: "9782"))
    }
    
    func testInput2Plus_ItReturns2() {
        let displayResult = calculate(input: ["2", "+"])
        XCTAssertEqual(displayResult, State(reducedInput: ["2", "+"], displayValue: "2"))
    }
    
    func testInput5Minus_ItReturns5() {
        let displayResult = calculate(input: ["5", "-"])
        XCTAssertEqual(displayResult, State(reducedInput: ["5", "-"], displayValue: "5"))
    }
    
    func testInput7Multiply_ItReturns7() {
        let displayResult = calculate(input: ["7", "*"])
        XCTAssertEqual(displayResult, State(reducedInput: ["7", "*"], displayValue: "7"))
    }
    
    func testInput9Divide_ItReturns9() {
        let displayResult = calculate(input: ["9", "/"])
        XCTAssertEqual(displayResult, State(reducedInput: ["9", "/"], displayValue: "9"))
    }
    
    func testInput2Plus3_ItReturns3() {
        let displayResult = calculate(input: ["2", "+", "3"])
        XCTAssertEqual(displayResult, State(reducedInput: ["2", "+", "3"], displayValue: "3"))
    }
    
    func testInput1Plus47_ItReturns47() {
        let displayResult = calculate(input: ["1", "+", "4", "7"])
        XCTAssertEqual(displayResult, State(reducedInput: ["1", "+", "4", "7"], displayValue: "47"))
    }
    
    func testInput35Minus19_ItReturns19() {
        let displayResult = calculate(input: ["3", "5", "-", "1", "9"])
        XCTAssertEqual(displayResult, State(reducedInput: ["3", "5", "-", "1", "9"], displayValue: "19"))
    }
    
    func testInput10Multiply3_ItReturns3() {
        let displayResult = calculate(input: ["1", "0", "*", "3"])
        XCTAssertEqual(displayResult, State(reducedInput: ["1", "0", "*", "3"], displayValue: "3"))
    }
    
    func testInput99Divide111_ItReturns111() {
        let displayResult = calculate(input: ["9", "9", "/", "1", "1", "1"])
        XCTAssertEqual(displayResult, State(reducedInput: ["9", "9", "/", "1", "1", "1"], displayValue: "111"))
    }
    
    func testInput1Plus2Minus_ItReturns3() {
        let displayResult = calculate(input: ["1", "+", "2", "-"])
        XCTAssertEqual(displayResult, State(reducedInput: ["3", "-"], displayValue: "3"))
    }
    
    func testInput71Minus23Divide_ItReturns48() {
        let displayResult = calculate(input: ["7", "1", "-", "2", "3", "/"])
        XCTAssertEqual(displayResult, State(reducedInput: ["48", "/"], displayValue: "48"))
    }
    
    func testInput4Multiply6Multiply_ItReturns24() {
        let displayResult = calculate(input: ["4", "*", "6", "*"])
        XCTAssertEqual(displayResult, State(reducedInput: ["24", "*"], displayValue: "24"))
    }
    
    func testInput27Divide3Plus_ItReturns9() {
        let displayResult = calculate(input: ["2", "7", "/", "3", "+"])
        XCTAssertEqual(displayResult, State(reducedInput: ["9", "+"], displayValue: "9"))
    }
    
    func testInput9PlusMinus_ItReturns9() {
        let displayResult = calculate(input: ["9", "+", "-"])
        XCTAssertEqual(displayResult, State(reducedInput: ["9", "-"], displayValue: "9"))
    }
    
    func testInput4DivideMinusMultiplyPlus_ItReturns4() {
        let displayResult = calculate(input: ["4", "/", "-", "*", "+"])
        XCTAssertEqual(displayResult, State(reducedInput: ["4", "+"], displayValue: "4"))
    }
    
    func testInput1Divide2Equal_ItReturns0_5() {
        let displayResult = calculate(input: ["1", "/", "2", "="])
        XCTAssertEqual(displayResult, State(reducedInput: ["0.5", "="], displayValue: "0.5"))
    }
    
    func testInput5Equal2_ItReturns2() {
        let displayResult = calculate(input: ["5", "=", "2"])
        XCTAssertEqual(displayResult, State(reducedInput: ["2"], displayValue: "2"))
    }
    
    func testInput7Equal3Plus_ItReturns3() {
        let displayResult = calculate(input: ["7", "=", "3", "+"])
        XCTAssertEqual(displayResult, State(reducedInput: ["3", "+"], displayValue: "3"))
    }
    
    func testInput8Equal5Equal_ItReturns5() {
        let displayResult = calculate(input: ["8", "=", "5", "="])
        XCTAssertEqual(displayResult, State(reducedInput: ["5", "="], displayValue: "5"))
    }
    
    func testInput0_24Plus1Equal_ItReturns1_24() {
        let displayResult = calculate(input: ["0", ".", "2", "4", "+", "1", "="])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["1.24", "="], displayValue: "1.24"))
    }
    
    func testInputMinus2Minus_ItReturnsMinus2() {
        let displayResult = calculate(input: ["-", "2", "-"])
        XCTAssertEqual(displayResult, State(reducedInput: ["-2", "-"], displayValue: "-2"))
    }
    
    func testInputEqual5Minus_ItReturns5() {
        let displayResult = calculate(input: ["=", "5", "-"])
        XCTAssertEqual(displayResult, State(reducedInput: ["5", "-"], displayValue: "5"))
    }
    
    func testInputMultiply2Plus_ItReturns0() {
        let displayResult = calculate(input: ["*", "2", "+"])
        XCTAssertEqual(displayResult, State(reducedInput: ["0", "+"], displayValue: "0"))
    }
    
    func testInputDivide3Equal_ItReturns0() {
        let displayResult = calculate(input: ["/", "3", "="])
        XCTAssertEqual(displayResult, State(reducedInput: ["0", "="], displayValue: "0"))
    }
    
    func testInputEqual5Minus1_ItReturns1() {
        let displayResult = calculate(input: ["=", "5", "-", "1"])
        XCTAssertEqual(displayResult, State(reducedInput: ["=", "5", "-", "1"], displayValue: "1"))
    }

    func testInputMultiply_ItReturns() {
        let displayResult = calculate(input: ["*"])
        XCTAssertEqual(displayResult, State(reducedInput: ["0", "*"], displayValue: "0"))
    }
    
    func testInput0_ItReturns0() {
        let displayResult = calculate(input: ["0"])
        
        XCTAssertEqual(displayResult, State(reducedInput: [], displayValue: "0"))
    }
    
    func testInput10_ItReturns10() {
        let displayResult = calculate(input: ["1", "0"])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["1", "0"], displayValue: "10"))
    }
    
    func testInputDot_ItReturns0Dot() {
        let displayResult = calculate(input: ["."])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["0", "."], displayValue: "0."))
    }
    
    func testInput5DotMinus_ItReturns5Dot() {
        let displayResult = calculate(input: ["5", ".", "-"])

        XCTAssertEqual(displayResult, State(reducedInput: ["5", ".", "-"], displayValue: "5."))
    }
    
    func testInput5DotMinus3_ItReturns3() {
        let displayResult = calculate(input: ["5", ".", "-", "3"])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["5", ".", "-", "3"], displayValue: "3"))
    }
    
    func testInput5DotMinus3Equal_ItReturns2() {
        let displayResult = calculate(input: ["5", ".", "-", "3", "="])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["2", "="], displayValue: "2"))
    }
    
    func testWhenTappedOn7Dot2Dot_ItDisplays7Dot2() {
        let displayResult = calculate(input: ["7", ".", "2", "."])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["7", ".", "2"], displayValue: "7.2"))
    }
    
    func testWhenTappedOn8Divide2Equal1_ItDisplays1() {
        let displayResult = calculate(input: ["8", "/", "2", "=", "1"])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["1"], displayValue: "1"))
    }
    
    func testWhenTappedOnDot8Plus_ItDisplays0Dot8() {
        let displayResult = calculate(input: [".", "8", "+"])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["0", ".", "8", "+"], displayValue: "0.8"))
    }
    
    func testWhenTappedOn7PlusDot2_ItDisplays0Dot2() {
        let displayResult = calculate(input: ["7", "+", ".", "2"])
        
        XCTAssertEqual(displayResult, State(reducedInput: ["7", "+", ".", "2"], displayValue: "0.2"))
    }
    
    func testWhenTappedOn7Divide2EqualDot_ItDisplays0Dot() {
        let displayResult = calculate(input: ["7", "/", "2", "=", "."])

        XCTAssertEqual(displayResult, State(reducedInput: ["."], displayValue: "0."))
    }

}
