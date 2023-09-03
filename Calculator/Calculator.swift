import Foundation

struct Result: Equatable {
    let reducedInput: [String]
    let displayValue: String
}

private let operators: [String] = ["+", "-", "*", "/", "="]

func calculate(input: [String]) -> Result {
    guard let lastElement = input.last else {
        return Result(reducedInput: [], displayValue: "0")
    }

    let lastOperator = input.last(where: { element in operators.contains(element) })
    let isLastElementOperator = operators.contains(lastElement)

    let reducedInput: [String]
    let displayResults: [String]
    
    if let parsedInput = parse(input: input), isLastElementOperator {
        let leftNumber = try! Decimal(parsedInput.lhsNumber, format: .number)
        let rightNumber = try! Decimal(parsedInput.rhsNumber, format: .number)
        let mathResult: Decimal

        if parsedInput.operator == "+" {
            mathResult = leftNumber + rightNumber
        } else if parsedInput.operator == "-" {
            mathResult = leftNumber - rightNumber
        } else if parsedInput.operator == "*" {
            mathResult = leftNumber * rightNumber
        } else if parsedInput.operator == "/" {
            mathResult = leftNumber / rightNumber
        } else {
            mathResult = rightNumber
        }
        
        displayResults = ["\(mathResult)"]
        reducedInput = lastOperator == "=" ? displayResults : displayResults + input.suffix(1)
    } else if lastOperator == lastElement {
        displayResults = input.filter({ element in !operators.contains(element) })
        reducedInput = displayResults + input.suffix(1)
    } else if let lastOperator = lastOperator {
        let splitResult = input.split(separator: lastOperator).suffix(1)
        displayResults = splitResult.flatMap(Array.init)
        reducedInput = lastOperator == "=" ? displayResults : input
    } else {
        displayResults = input
        reducedInput = input
    }

    return Result(reducedInput: reducedInput, displayValue: displayResults.joined())
}

private struct ParsedResult {
    let lhsNumber: String
    let rhsNumber: String
    let `operator`: String
}

private func parse(input: [String]) -> ParsedResult? {
    guard let `operator` = input.first(where: { element in operators.contains(element) }) else {
        return nil
    }
    
    let expression = input.split(separator: `operator`)
    
    guard expression.count > 1 else {
        return nil
    }
    
    let lhs = expression[0].filter { value in !operators.contains(value) }.joined()
    let rhs = expression[1].filter { value in !operators.contains(value) }.joined()
    
    guard !lhs.isEmpty && !rhs.isEmpty else {
        return nil
    }
    
    return .init(lhsNumber: lhs, rhsNumber: rhs, operator: `operator`)
}
