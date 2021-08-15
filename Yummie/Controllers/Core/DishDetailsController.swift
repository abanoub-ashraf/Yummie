import UIKit

class DishDetailsController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - IBActions

    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {        
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
