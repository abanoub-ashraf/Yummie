import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    // MARK: - IBOutlets

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    // MARK: - Helper Functions

    func setup(_ slide: OnboardingSlideModel) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
