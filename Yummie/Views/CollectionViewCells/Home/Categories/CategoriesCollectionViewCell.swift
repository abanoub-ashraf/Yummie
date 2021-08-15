import UIKit
import Kingfisher

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let identifier = String(describing: CategoriesCollectionViewCell.self)
    
    // MARK: - IBOutlets

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions

    func setup(_ category: DishCategory) {
        categoryLabel.text = category.name
        
        categoryImageView.kf.setImage(with: category.image?.asURL, placeholder: Constants.categoryPlaceholderImage)
    }

}
