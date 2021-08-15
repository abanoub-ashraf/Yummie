import UIKit

class HomeController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // MARK: - Properties

    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    // MARK: - Helper Functions

    private func configureCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView.register(
            UINib(nibName: CategoriesCollectionViewCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier
        )
    }

}

// MARK: - UICollectionViewDataSource

extension HomeController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    }
    
}

// MARK: - UICollectionViewDelegate

extension HomeController: UICollectionViewDelegate {
    
}
