import Foundation

struct Result: Equatable {
    let reducedInput: [String]
    let displayValue: String
}

func calculate(input: [String]) -> Result {
    guard let lastElement = input.last else {
        return Result(reducedInput: [], displayValue: "0")
    }
    
    let operators: [String] = ["+", "-", "*", "/"]
    let hasMoreThanOneOperator = input.filter({ element in operators.contains(element) }).count > 1
    let firstOperator = input.first(where: { element in operators.contains(element) })
    let lastOperator = input.last(where: { element in operators.contains(element) })
    let isLastElementOperator = operators.contains(lastElement)
    let result: [String]
    let reducedInput: [String]
    
    func hasValidExpression(input: [String]) -> Bool {
        let lastOperator = input.dropLast().last!
        let isLastElementOperator = operators.contains(lastOperator)
        
        return !isLastElementOperator
    }
    
    if let `operator` = firstOperator, hasMoreThanOneOperator, isLastElementOperator, hasValidExpression(input: input) {
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
        reducedInput = result + [lastOperator].compactMap({ element in element })
    } else if let `operator` = lastOperator, hasMoreThanOneOperator {
        result = input.filter({ element in !operators.contains(element) })
        reducedInput = result + [`operator`]
    } else if let `operator` = lastOperator {
        let splitResult = input.split(separator: `operator`)
        
        result = Array(splitResult.last!)
        reducedInput = input
    } else {
        result = input
        reducedInput = input
    }
    
    return Result(reducedInput: reducedInput, displayValue: result.joined())
}
