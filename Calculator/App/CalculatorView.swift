import Anchorage
import UIKit

class CalculatorView: UIView {
    
    let inputLabel = UILabel()
    let containerStackView = UIView()
    
    lazy var verticalStackView = UIStackView.makeVerticalStackView(
        arrangedSubviews: [firstHorizontalStackView, secondHorizontalStackView, thirdHorizontalStackView, fourthHorizontalStackView, fifthHorizontalStackView],
        distribution: .fillEqually
    )
    
    let clearButtonView = ShadowButtonView(title: "AC")
    let removeButtonView = ShadowButtonView(title: "⌫")
    let divideButtonView = ShadowButtonView(title: "÷")
    private lazy var firstHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [clearButtonView, removeButtonView, divideButtonView],
        distribution: .fill
    )
    
    let sevenButtonView = ShadowButtonView(title: "7")
    let eightButtonView = ShadowButtonView(title: "8")
    let nineButtonView = ShadowButtonView(title: "9")
    let multiplyButtonView = ShadowButtonView(title: "×")
    private lazy var secondHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [sevenButtonView, eightButtonView, nineButtonView, multiplyButtonView],
        distribution: .fillEqually
    )

    let fourButtonView = ShadowButtonView(title: "4")
    let fiveButtonView = ShadowButtonView(title: "5")
    let sixButtonView = ShadowButtonView(title: "6")
    let minusButtonView = ShadowButtonView(title: "−")
    private lazy var thirdHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [fourButtonView, fiveButtonView, sixButtonView, minusButtonView],
        distribution: .fillEqually
    )
    
    let oneButtonView = ShadowButtonView(title: "1")
    let twoButtonView = ShadowButtonView(title: "2")
    let threeButtonView = ShadowButtonView(title: "3")
    let plusButtonView = ShadowButtonView(title: "+")
    private lazy var fourthHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [oneButtonView, twoButtonView, threeButtonView, plusButtonView],
        distribution: .fillEqually
    )

    let zeroButtonView = ShadowButtonView(title: "0")
    let dotButtonView = ShadowButtonView(title: ".")
    let equalButtonView = ShadowButtonView(title: "=")
    private lazy var fifthHorizontalStackView = UIStackView.makeHorizontalStackView(
        arrangedSubviews: [zeroButtonView, dotButtonView, equalButtonView],
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
        
        oneButtonView.heightAnchor == oneButtonView.widthAnchor
        zeroButtonView.widthAnchor == oneButtonView.widthAnchor
        dotButtonView.widthAnchor == oneButtonView.widthAnchor
        divideButtonView.widthAnchor == oneButtonView.widthAnchor
        removeButtonView.widthAnchor == oneButtonView.widthAnchor
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension UIButton {
    
    static func makeGrayButton(title: String) -> UIButton {
        makeButton(title: title, titleColor: .darkGray)
    }
    
    static func makeGoldButton(title: String) -> UIButton {
        makeButton(title: title, titleColor: .gold)
    }
    
    private static func makeButton(title: String, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        button.backgroundColor = .offWhite
        
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

private extension UIView {
    func addSublayersIfNeeded(sublayers: [CALayer], to targetLayer: CALayer) {
        sublayers
            .filter({ !(targetLayer.sublayers ?? []).contains($0) })
            .forEach({ targetLayer.insertSublayer($0, at: 0) })
    }
}

class ShadowButtonView: UIView {
    
    let button: UIButton
    
    init(title: String) {
        button = UIButton.makeGrayButton(title: title)
        super.init(frame: .zero)
        addSubview(button)
        button.edgeAnchors == edgeAnchors
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        addSublayersIfNeeded(sublayers: [topButtonLayer, bottomButtonLayer], to: button.layer)
    }
    
    private lazy var topButtonLayer = createShadowLayer(
        color: .black.withAlphaComponent(0.2),
        fillColor: button.backgroundColor,
        offset: .init(width: 10,height: 10),
        bounds: button.bounds
    )
    private lazy var bottomButtonLayer = createShadowLayer(
        color: .white.withAlphaComponent(0.7),
        fillColor: button.backgroundColor,
        offset: .init(width: -5, height: -5),
        bounds: button.bounds
    )
    
    private func createShadowLayer(
        color: UIColor,
        fillColor: UIColor?,
        offset: CGSize,
        bounds: CGRect
    ) -> CALayer {
        let cornerRadius: CGFloat = 10
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.fillColor = fillColor?.cgColor
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = 1
        layer.shadowRadius = cornerRadius
        layer.masksToBounds = false

        return layer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
