import UIKit

class OrdersListController: UIViewController {
    
    // MARK: - Properties
    
    var orders: [OrderModel] = [
        .init(
            id: "id1",
            name: "Emmanuel",
            dish: .init(
                id: "id1",
                name: "dish1",
                image: "https://picsum.photos/100/200",
                calories: 34,
                description: "Best thing i ever had in my mouth!"
            )
        ),
        .init(
            id: "id2",
            name: "Mike",
            dish: .init(
                id: "id2",
                name: "dish2",
                image: "https://picsum.photos/100/200",
                calories: 45,
                description: "Best thing i ever had!"
            )
        ),
        .init(
            id: "id3",
            name: "Jack",
            dish: .init(
                id: "id3",
                name: "dish3",
                image: "https://picsum.photos/100/200",
                calories: 50,
                description: "Very very bad, not recommended!"
            )
        ),
        .init(
            id: "id4",
            name: "Anton",
            dish: .init(
                id: "id4",
                name: "dish4",
                image: "https://picsum.photos/100/200",
                calories: 76,
                description: "Best thing i ever had in my belly!"
            )
        ),
    ]

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        
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

extension OrdersListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
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
        
        cell.setupOrder(order: orders[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension OrdersListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = DishDetailsController.instantiate()
        controller.dish = orders[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
