import XCTest

func calculate(input: [String]) -> String {
    guard let lastElement = input.last else {
        return "0"
    }
    
    let operators: [String] = ["+", "-", "*", "/"]
    let result: [String]
    
    if operators.contains(lastElement) {
        result = input.dropLast()
    } else if let `operator` = input.last(where: { element in operators.contains(element) }) {
        let splitResult = input.split(separator: `operator`, maxSplits: 1)
        result = Array(splitResult.last!)
    } else {
        result = input
    }

    return result.joined()
}

class CalculatorTests: XCTestCase {

    func testInputEmpty_ItReturns0() {
        let displayResult = calculate(input: [])
        XCTAssertEqual(displayResult, "0")
    }
    
    func testInput2_ItReturns2() {
        let displayResult = calculate(input: ["2"])
        XCTAssertEqual(displayResult, "2")
    }
    
    func testInput7_ItReturns7() {
        let displayResult = calculate(input: ["7"])
        XCTAssertEqual(displayResult, "7")
    }
    
    func testInput23_ItReturns23() {
        let displayResult = calculate(input: ["2", "3"])
        XCTAssertEqual(displayResult, "23")
    }
    
    func testInput9782_ItReturns9782() {
        let displayResult = calculate(input: ["9", "7", "8", "2"])
        XCTAssertEqual(displayResult, "9782")
    }
    
    func testInput2Plus_ItReturns2() {
        let displayResult = calculate(input: ["2", "+"])
        XCTAssertEqual(displayResult, "2")
    }
    
    func testInput5Minus_ItReturns5() {
        let displayResult = calculate(input: ["5", "-"])
        XCTAssertEqual(displayResult, "5")
    }
    
    func testInput7Multiply_ItReturns7() {
        let displayResult = calculate(input: ["7", "*"])
        XCTAssertEqual(displayResult, "7")
    }
    
    func testInput9Divide_ItReturns9() {
        let displayResult = calculate(input: ["9", "/"])
        XCTAssertEqual(displayResult, "9")
    }
    
    func testInput2Plus3_ItReturns3() {
        let displayResult = calculate(input: ["2", "+", "3"])
        XCTAssertEqual(displayResult, "3")
    }
    
    func testInput1Plus47_ItReturns47() {
        let displayResult = calculate(input: ["1", "+", "4", "7"])
        XCTAssertEqual(displayResult, "47")
    }
    
    func testInput35Minus19_ItReturns19() {
        let displayResult = calculate(input: ["3", "5", "-", "1", "9"])
        XCTAssertEqual(displayResult, "19")
    }
    
    func testInput10Multiply3_ItReturns3() {
        let displayResult = calculate(input: ["1", "0", "*", "3"])
        XCTAssertEqual(displayResult, "3")
    }
    
    func testInput999Divide111_ItReturns111() {
        let displayResult = calculate(input: ["9", "9", "/", "1", "1", "1"])
        XCTAssertEqual(displayResult, "111")
    }

}
