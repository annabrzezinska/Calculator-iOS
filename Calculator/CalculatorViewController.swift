import UIKit

class CalculatorViewController: UIViewController {
    lazy var ownView = CalculatorView()
    override func loadView() {
        view = ownView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ownView.inputLabel.text = "0"
    }
}
