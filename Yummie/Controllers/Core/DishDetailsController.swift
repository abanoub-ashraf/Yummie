import UIKit
import Kingfisher

class DishDetailsController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Properties

    var dish: Dish!
    
    // MARK: - IBActions

    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {}

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateUI()
    }
    
    // MARK: - Helper Functions
    
    private func populateUI() {
        dishImage.kf.setImage(with: dish.image?.asURL, placeholder: Constants.categoryPlaceholderImage)
        dishTitle.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
