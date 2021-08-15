import UIKit

extension UIView {
    ///
    /// this means this variable is gonna appear in storyboard in the attributes inspector
    ///
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
