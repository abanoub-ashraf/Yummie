import UIKit

class HomeController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    
    // MARK: - Properties

    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id2", name: "Pasta", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id3", name: "Grilled Cheese", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id4", name: "Pizza", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id5", name: "Burger", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id6", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id7", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id8", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id9", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id10", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted")
    ]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionViews()
    }
    
    // MARK: - Helper Functions

    private func configureCollectionViews() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        dishesCollectionView.delegate = self
        dishesCollectionView.dataSource = self
        
        categoryCollectionView.register(
            UINib(nibName: CategoriesCollectionViewCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier
        )
        
        dishesCollectionView.register(
            UINib(nibName: DishesCollectionViewCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: DishesCollectionViewCell.identifier
        )
    }

}

// MARK: - UICollectionViewDataSource

extension HomeController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case categoryCollectionView:
                return categories.count
            case dishesCollectionView:
                return dishes.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case categoryCollectionView:
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: CategoriesCollectionViewCell.identifier,
                        for: indexPath
                    ) as? CategoriesCollectionViewCell
                else {
                    return UICollectionViewCell()
                }
                
                cell.setup(categories[indexPath.row])
                return cell
                
            case dishesCollectionView:
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: DishesCollectionViewCell.identifier,
                        for: indexPath
                    ) as? DishesCollectionViewCell
                else {
                    return UICollectionViewCell()
                }
                
                cell.setup(dishes[indexPath.row])
                return cell
            default:
                return UICollectionViewCell()
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension HomeController: UICollectionViewDelegate {
    
}
