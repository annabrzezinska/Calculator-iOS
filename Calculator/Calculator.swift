import Foundation

func calculate(input: [String]) -> String {
    guard let lastElement = input.last else {
        return "0"
    }
    
    let operators: [String] = ["+", "-", "*", "/"]
    let result: [String]
    let hasMoreThanOneOperator = input.filter({element in operators.contains(element)}).count > 1
    let lastOperator = input.last(where: { element in operators.contains(element) })
    let firstOperator = input.first(where: { element in operators.contains(element) })
    
    if operators.contains(lastElement) {
        if let `operator` = firstOperator, hasMoreThanOneOperator {
            let inputWithoutLastOperator = input.dropLast()
            let expression = inputWithoutLastOperator.split(separator: `operator`)
            let leftNumberString = expression[0].joined()
            let rightNumberString = expression[1].joined()
            
            let leftNumber = try! Decimal.init(leftNumberString, format: .number)
            let rightNumber = try! Decimal.init(rightNumberString, format: .number)
            let mathResult: Decimal
            
            if `operator` == "+" {
                mathResult = leftNumber + rightNumber
            } else if `operator` == "-" {
                mathResult = leftNumber - rightNumber
            } else if `operator` == "*"{
                mathResult = leftNumber * rightNumber
            } else {
                mathResult = leftNumber / rightNumber
            }
            result = ["\(mathResult)"]
        } else {
            result = input.dropLast()
        }
    } else if let `operator` = lastOperator {
        let splitResult = input.split(separator: `operator`, maxSplits: 1)
        result = Array(splitResult.last!)
    } else {
        result = input
    }

    return result.joined()
}
