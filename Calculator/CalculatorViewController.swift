import UIKit

class CalculatorViewController: UIViewController {

    override func loadView() {
        view = ownView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state = .initialState
        setUpButtonActions()
    }
    
    // MARK: - Private
    
    private var state: State = .initialState {
        didSet {
            ownView.inputLabel.text = state.displayValue
        }
    }
    
    private lazy var ownView = CalculatorView()
    
    private func setUpButtonActions() {
        let buttonsWithActions: [(button: UIButton, action: Selector)] = [
            (ownView.oneButton, #selector(oneButtonTapped)),
            (ownView.twoButton, #selector(twoButtonTapped)),
            (ownView.threeButton, #selector(threeButtonTapped)),
            (ownView.fourButton, #selector(fourButtonTapped)),
            (ownView.fiveButton, #selector(fiveButtonTapped)),
            (ownView.sixButton, #selector(sixButtonTapped)),
            (ownView.sevenButton, #selector(sevenButtonTapped)),
            (ownView.eightButton, #selector(eightButtonTapped)),
            (ownView.nineButton, #selector(nineButtonTapped)),
            (ownView.zeroButton, #selector(zeroButtonTapped)),
            (ownView.dotButton, #selector(dotButtonTapped)),
            (ownView.plusButton, #selector(plusButtonTapped)),
            (ownView.minusButton, #selector(minusButtonTapped)),
            (ownView.multiplyButton, #selector(multiplyButtonTapped)),
            (ownView.divideButton, #selector(divideButtonTapped)),
            (ownView.equalButton, #selector(equalButtonTapped)),
            (ownView.clearButton, #selector(clearButtonTapped)),
            (ownView.removeButton, #selector(removeButtonTapped))
        ]
        
        buttonsWithActions.forEach { button, selector in
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
    }
    
    @objc
    private func oneButtonTapped() {
        updateState(withInput: "1")
    }
    
    @objc
    private func twoButtonTapped() {
        updateState(withInput: "2")
    }
    
    @objc
    private func threeButtonTapped() {
        updateState(withInput: "3")
    }
    @objc
    private func fourButtonTapped() {
        updateState(withInput: "4")
    }
    
    @objc
    private func fiveButtonTapped() {
        updateState(withInput: "5")
    }
    
    @objc
    private func sixButtonTapped() {
        updateState(withInput: "6")
    }
    
    @objc
    private func sevenButtonTapped() {
        updateState(withInput: "7")
    }
    
    @objc
    private func eightButtonTapped() {
        updateState(withInput: "8")
    }
    
    @objc
    private func nineButtonTapped() {
        updateState(withInput: "9")
    }
    
    @objc
    private func zeroButtonTapped() {
        updateState(withInput: "0")
    }
    
    @objc
    private func dotButtonTapped() {
        updateState(withInput: ".")
    }
    
    @objc
    private func plusButtonTapped() {
        updateState(withInput: "+")
    }
    
    @objc
    private func minusButtonTapped() {
        updateState(withInput: "-")
    }
    
    @objc
    private func multiplyButtonTapped() {
        updateState(withInput: "*")
    }
    
    @objc
    private func divideButtonTapped() {
        updateState(withInput: "/")
    }
    
    @objc
    private func equalButtonTapped() {
        updateState(withInput: "=")
    }
    
    @objc
    private func clearButtonTapped() {
        state = calculate(input: [])
    }
    
    @objc
    private func removeButtonTapped() {
        state = calculate(input: state.reducedInput.dropLast())
    }
    
    private func updateState(withInput input: String) {
        state = calculate(input: state.reducedInput + [input])
    }

}

private extension State {
    
    static var initialState: Self {
        .init(reducedInput: [], displayValue: "0")
    }
    
}
