import Foundation

extension String {
    
    ///
    /// convert the string into url
    ///
    var asURL: URL? {
        return URL(string: self)
    }
    
}
