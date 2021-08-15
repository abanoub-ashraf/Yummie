import UIKit
import Kingfisher

class DishesCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = String(describing: DishesCollectionViewCell.self)
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions

    func setup(_ dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL, placeholder: Constants.categoryPlaceholderImage)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }


}
