import Foundation

struct State: Equatable {
    let reducedInput: [String]
    let displayValue: String
}

private let operators: [String] = ["+", "-", "*", "/", "="]

func calculate(input: [String]) -> State {
    guard let lastElement = input.last else {
        return State(reducedInput: [], displayValue: "0")
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
        reducedInput = displayResults + input.suffix(1)
    } else if input.first == "." {
        reducedInput = ["0"] + input
        displayResults = reducedInput
    } else if lastOperator == lastElement { // FIXME: Needs to be refactored
        displayResults = input.first == lastOperator ? ["0"] : input.filter({ element in !operators.contains(element) })
        reducedInput = input.first == lastOperator ? ["0"] + input : displayResults + input.suffix(1)
    } else if let lastOperator = lastOperator { // FIXME: Needs to be refactored
        let splitResult = input.split(separator: lastOperator).suffix(1)
        displayResults = splitResult.flatMap(Array.init)
        reducedInput = lastOperator == "=" ? displayResults : input
    } else if input.last == "." && input.filter({ element in element == "." }).count > 1 { // FIXME: Needs to be refactored
        displayResults = input.dropLast()
        reducedInput = displayResults
    } else {
        displayResults = input
        reducedInput = input.first == "0" ? Array(input.dropFirst()) : input // FIXME: Needs to be refactored
    }

    let filteredDisplayResult = displayResults.filter({element in !operators.contains(element)})
    return State(
        reducedInput: reducedInput,
        displayValue: filteredDisplayResult.first == "." ? ["0"] + filteredDisplayResult.joined() : filteredDisplayResult.joined()
    )
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
    
    let modifiedInput: [String] = input.first == `operator` ? ["0"] + input : input
    let expression = modifiedInput.split(separator: `operator`)
    
    guard expression.count > 1 else {
        return nil
    }
    
    let lhs = Array(expression[0])
    let rhs = Array(expression[1])
    
    let lhsNumber = filteredSide(ofExpression: lhs).joined()
    let rhsNumber = filteredSide(ofExpression: rhs).joined()
    
    guard !lhsNumber.isEmpty && !rhsNumber.isEmpty else {
        return nil
    }
    
    return .init(lhsNumber: lhsNumber, rhsNumber: rhsNumber, operator: `operator`)
}

/// This function takes left or right side of expression, filters out the operators and redundant dots
private func filteredSide(ofExpression expression: [String]) -> [String] {
    expression
        .filter { element in !operators.contains(element) }
        .enumerated()
        .filter { index, element in
            let isFirstDot = index == expression.firstIndex(of: ".")
            let isDifferentThanDot = element != "."
            
            return isFirstDot || isDifferentThanDot
        }
        .map { index, element in element }
}
