import UIKit

///
/// to initialize a view controller from storyboard
/// from the one that calls the instantiate() function
///
extension UIViewController {
    
    ///
    /// - the identifier of the controller we wanna instantiate from storyboard
    ///
    /// - in the idnetiy inspector the controller must ahve its own name as a storyboard identifier
    ///   in orde for that to work
    ///
    static var identifier: String {
        return String(describing: self)
    }
    
    ///
    /// call the controller that has the same identifier as the one that call this function to create it
    ///
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier) as! Self
        return controller
    }
    
}
