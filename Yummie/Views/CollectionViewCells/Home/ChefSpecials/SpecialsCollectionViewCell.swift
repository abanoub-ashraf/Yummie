import UIKit
import Kingfisher

class SpecialsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let identifier = String(describing: SpecialsCollectionViewCell.self)

    // MARK: - IBOutlets

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    func setup(_ dish: Dish) {
        dishImage.kf.setImage(with: dish.image?.asURL, placeholder: Constants.categoryPlaceholderImage)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
