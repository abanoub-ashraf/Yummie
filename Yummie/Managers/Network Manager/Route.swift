import Foundation

enum Route {
    static let baseUrl = Constants.baseUrl
    
    case fetchAllCategories
    
    var description: String {
        switch self {
            case .fetchAllCategories:
                return "/dish-categories"
        }
    }
    
}
