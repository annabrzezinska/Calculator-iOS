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

    let isLastElementOperator = operators.contains(lastElement)

    let reducedInput: [String]
    let displayResults: [String]

    let parsedInput = process(input: input)
    
    if let rhsNumber = parsedInput.rhsNumber, let `operator` = parsedInput.operator, isLastElementOperator {
        let leftNumber = try! Decimal(parsedInput.lhsNumber.joined(), format: .number)
        let rightNumber = try! Decimal(rhsNumber.joined(), format: .number)
        let mathResult: Decimal

        if `operator` == "+" {
            mathResult = leftNumber + rightNumber
        } else if `operator` == "-" {
            mathResult = leftNumber - rightNumber
        } else if `operator` == "*" {
            mathResult = leftNumber * rightNumber
        } else if `operator` == "/" {
            mathResult = leftNumber / rightNumber
        } else {
            mathResult = rightNumber
        }

        displayResults = ["\(mathResult)"]
        reducedInput = displayResults + input.suffix(1)
    } else if let rhsNumber = parsedInput.rhsNumber {
        displayResults = rhsNumber
        reducedInput = parsedInput.lhsNumber + [parsedInput.operator].compactMap { $0 } + rhsNumber
    } else {
        displayResults = parsedInput.lhsNumber
        reducedInput = parsedInput.lhsNumber + [parsedInput.operator].compactMap { $0 }
    }
    
    let displayValue = displayResults.joined()

    return State(
        reducedInput: reducedInput,
        displayValue: displayValue.isEmpty ? "0" : displayValue
    )
}

private struct ProcessedResult {
    let lhsNumber: [String]
    let rhsNumber: [String]?
    let `operator`: String?
}

private func process(input: [String]) -> ProcessedResult {
    guard input.first != "=" else {
        return .init(lhsNumber: [], rhsNumber: nil, operator: nil)
    }
    
    guard let `operator` = input.first(where: { element in operators.contains(element) }) else {
        return .init(lhsNumber: preprocessedSide(ofExpression: input, fallbackResult: ["0"]), rhsNumber: nil, operator: nil)
    }

    let expression = input.split(separator: `operator`)
    
    let lhs = expression[safe: 0].map(Array.init)
    let rhs = expression[safe: 1].map(Array.init)
    
    let lhsNumber = lhs.map { value in preprocessedSide(ofExpression: value, fallbackResult: ["0"]) }
    
    guard let lhsNumber = lhsNumber, !lhsNumber.isEmpty else {
        return .init(lhsNumber: ["0"], rhsNumber: nil, operator: `operator`)
    }
    
    let rhsNumber = rhs.map { value in preprocessedSide(ofExpression: value, fallbackResult: []) }

    guard let rhsNumber = rhsNumber, !rhsNumber.isEmpty else {
        let lastOperator = rhs?.last(where: { element in operators.contains(element) })
        let returnOperator = lastOperator ?? `operator`
        return .init(lhsNumber: lhsNumber, rhsNumber: nil, operator: returnOperator)
    }
    
    return .init(lhsNumber: lhsNumber, rhsNumber: rhsNumber, operator: `operator`)
}

private func preprocessedSide(ofExpression expression: [String], fallbackResult: [String]) -> [String] {
    prependZero(in: filteredSide(ofExpression: expression), fallbackResult: fallbackResult)
}

private func prependZero(in expression: [String], fallbackResult: [String]) -> [String] {
    guard let first = expression.first else {
        return fallbackResult

    }
    
    let operatorsWithoutEqual = operators.filter { $0 != "=" }
    let allowedOperators = operatorsWithoutEqual + ["."]
    
    return allowedOperators.contains(first) ? ["0"] + expression : expression
}

/// This function takes left or right side of expression, filters out the operators, redundant dots and leading zero
private func filteredSide(ofExpression expression: [String]) -> [String] {
    expression
        .filter { element in !operators.contains(element) }
        .enumerated()
        .filter { index, element in
            let isFirstDot = index == expression.firstIndex(of: ".")
            let isDifferentThanDot = element != "."
            
            return isFirstDot || isDifferentThanDot
        }
        .filter { index, element in
            let isFirstZero = index == 0 && element == "0"

            return !isFirstZero
        }
        .map { index, element in element }
}

private extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
