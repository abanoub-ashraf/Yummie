import UIKit

class CardView: UIView {
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialSetup()
    }
    
    // MARK: - Helper Functions

    private func initialSetup() {
        layer.shadowColor = Constants.borderColor?.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.4
        layer.borderColor = UIColor.systemFill.cgColor
        layer.borderWidth = 0.9
        cornerRadius = 10
    }
}
