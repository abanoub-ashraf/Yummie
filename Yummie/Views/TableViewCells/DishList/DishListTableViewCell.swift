import UIKit
import Kingfisher

class DishesListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    
    // MARK: - Properties

    static let identifier = String(describing: DishesListTableViewCell.self)
    
    // MARK: - Helper Functions

    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func setup(_ dish: Dish) {
        dishImage.kf.setImage(with: dish.image?.asURL, placeholder: Constants.categoryPlaceholderImage)
        dishTitle.text = dish.name
        dishDescription.text = dish.description
    }
    
}
