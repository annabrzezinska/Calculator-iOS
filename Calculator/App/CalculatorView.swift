import Anchorage
import UIKit

class CalculatorView: UIView {
    
    let inputLabel = UILabel()
    let containerStackView = UIView()
    
    lazy var verticalStackView = UIStackView.makeVerticalStackView(
        arrangedSubviews: [firstHorizontalStackView, secondHorizontalStackView, thirdHorizontalStackView, fourthHorizontalStackView, fifthHorizontalStackView],
        distribution: .fillEqually
    )
    
    let clearButton = UIButton.makeGrayButton(title: "AC")
    let removeButton = UIButton.makeGrayButton(title: "⌫")
    let divideButton = UIButton.makeGoldButton(title: "÷")
    private lazy var firstHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [clearButton, removeButton, divideButton],
        distribution: .fill
    )
    
    let sevenButton = UIButton.makeGrayButton(title: "7")
    let eightButton = UIButton.makeGrayButton(title: "8")
    let nineButton = UIButton.makeGrayButton(title: "9")
    let multiplyButton = UIButton.makeGoldButton(title: "×")
    private lazy var secondHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [sevenButton, eightButton, nineButton, multiplyButton],
        distribution: .fillEqually
    )

    let fourButton = UIButton.makeGrayButton(title: "4")
    let fiveButton = UIButton.makeGrayButton(title: "5")
    let sixButton = UIButton.makeGrayButton(title: "6")
    let minusButton = UIButton.makeGoldButton(title: "−")
    private lazy var thirdHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [fourButton, fiveButton, sixButton, minusButton],
        distribution: .fillEqually
    )
    
    let oneButton = UIButton.makeGrayButton(title: "1")
    let twoButton = UIButton.makeGrayButton(title: "2")
    let threeButton = UIButton.makeGrayButton(title: "3")
    let plusButton = UIButton.makeGoldButton(title: "+")
    private lazy var fourthHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [oneButton, twoButton, threeButton, plusButton],
        distribution: .fillEqually
    )

    let zeroButton = UIButton.makeGrayButton(title: "0")
    let dotButton = UIButton.makeGrayButton(title: ".")
    let equalButton = UIButton.makeGoldButton(title: "=")
    private lazy var fifthHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [zeroButton, dotButton, equalButton],
        distribution: .fill
    )
    
    init() {
        super.init(frame: .zero)
        setupSelf()
        addSubviews()
        setupConstraints()
    }
    
    func setupSelf() {
        backgroundColor = .offWhite
        
        inputLabel.adjustsFontSizeToFitWidth = true
        inputLabel.font = UIFont.systemFont(ofSize: 100, weight: .light)
        inputLabel.textAlignment = .right
        inputLabel.textColor = .darkGray
    }
    
    func addSubviews() {
        containerStackView.addSubview(verticalStackView)
        
        addSubview(inputLabel)
        addSubview(containerStackView)
    }
    
    func setupConstraints() {
        inputLabel.topAnchor == topAnchor + 191
        inputLabel.horizontalAnchors == horizontalAnchors + 20
        
        containerStackView.topAnchor == inputLabel.bottomAnchor + 40
        containerStackView.horizontalAnchors == horizontalAnchors + 20
        containerStackView.bottomAnchor == safeAreaLayoutGuide.bottomAnchor - 40
        
        verticalStackView.topAnchor == containerStackView.topAnchor
        verticalStackView.horizontalAnchors == containerStackView.horizontalAnchors
        verticalStackView.heightAnchor == containerStackView.heightAnchor
        
        oneButton.heightAnchor == oneButton.widthAnchor
        zeroButton.widthAnchor == oneButton.widthAnchor
        dotButton.widthAnchor == oneButton.widthAnchor
        divideButton.widthAnchor == oneButton.widthAnchor
        removeButton.widthAnchor == oneButton.widthAnchor
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension UIButton {
    
    static func makeGrayButton(title: String) -> UIButton {
        makeButton(title: title, titleColor: .darkGray, borderColor: UIColor.darkGray)
    }
    
    static func makeGoldButton(title: String) -> UIButton {
        makeButton(title: title, titleColor: .gold, borderColor: UIColor.gold)
    }
    
    private static func makeButton(title: String, titleColor: UIColor, borderColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        button.backgroundColor = .offWhite
        button.layer.borderWidth = 1.5
        button.layer.borderColor = borderColor.cgColor
        button.layer.cornerRadius = 10
        
        return button
    }
    
}

private extension UIColor {
    static var offWhite = UIColor(named: "offWhite")!
    static var gold = UIColor(named: "gold")!
}

private extension UIStackView {
    
    static func makeVerticalStackView(
        arrangedSubviews: [UIView],
        distribution: UIStackView.Distribution
    ) -> UIStackView {
        makeStackView(
            arrangedSubviews: arrangedSubviews,
            axis: .vertical,
            distribution: distribution
        )
    }
    
    static func makeHorizontalStackView(
        arrangedSubviews: [UIView],
        distribution: UIStackView.Distribution
    ) -> UIStackView {
        makeStackView(
            arrangedSubviews: arrangedSubviews,
            axis: .horizontal,
            distribution: distribution
        )
    }

    private static func makeStackView(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = 20
        
        return stackView
    }

}
