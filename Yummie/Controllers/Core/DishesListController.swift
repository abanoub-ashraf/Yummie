import UIKit

class DishesListController: UIViewController {

    // MARK: - Properties

    var dishesList: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted"),
        .init(id: "id2", name: "Pasta", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id3", name: "Grilled Cheese", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id4", name: "Pizza", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id5", name: "Burger", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id6", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id7", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id8", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted")
    ]
    
    var category: DishCategory!
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        
        configureTableView()
    }
    
    // MARK: - Helper Functions
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            DishesListTableViewCell.nib(),
            forCellReuseIdentifier: DishesListTableViewCell.identifier
        )
    }

}

// MARK: - UITableViewDataSource

extension DishesListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: DishesListTableViewCell.identifier,
                for: indexPath
            ) as? DishesListTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setup(dishesList[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension DishesListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = DishDetailsController.instantiate()
        controller.dish = dishesList[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
