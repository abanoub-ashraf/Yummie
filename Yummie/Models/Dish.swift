import Foundation

struct Dish {
    let id: String?
    let name: String?
    let image: String?
    let calories: Int?
    let description: String?
    
    var formattedCalories: String {
        return "\(calories ?? 0) Calories"
    }
    
}
