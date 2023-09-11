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
            (ownView.oneButtonView.button, #selector(oneButtonTapped)),
            (ownView.twoButtonView.button, #selector(twoButtonTapped)),
            (ownView.threeButtonView.button, #selector(threeButtonTapped)),
            (ownView.fourButtonView.button, #selector(fourButtonTapped)),
            (ownView.fiveButtonView.button, #selector(fiveButtonTapped)),
            (ownView.sixButtonView.button, #selector(sixButtonTapped)),
            (ownView.sevenButtonView.button, #selector(sevenButtonTapped)),
            (ownView.eightButtonView.button, #selector(eightButtonTapped)),
            (ownView.nineButtonView.button, #selector(nineButtonTapped)),
            (ownView.zeroButtonView.button, #selector(zeroButtonTapped)),
            (ownView.dotButtonView.button, #selector(dotButtonTapped)),
            (ownView.plusButtonView.button, #selector(plusButtonTapped)),
            (ownView.minusButtonView.button, #selector(minusButtonTapped)),
            (ownView.multiplyButtonView.button, #selector(multiplyButtonTapped)),
            (ownView.divideButtonView.button, #selector(divideButtonTapped)),
            (ownView.equalButtonView.button, #selector(equalButtonTapped)),
            (ownView.clearButtonView.button, #selector(clearButtonTapped)),
            (ownView.removeButtonView.button, #selector(removeButtonTapped))
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
