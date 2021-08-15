import UIKit

class HomeController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var dishesCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    // MARK: - Properties

    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted, This is the best I have ever tasted"),
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
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id2", name: "Pasta", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id3", name: "Grilled Cheese", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id4", name: "Pizza", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id5", name: "Burger", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted"),
        .init(id: "id6", name: "Garri", image: "https://picsum.photos/100/200", calories: 34, description: "This is the best I have ever tasted")
    ]


    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionViews()
    }
    
    // MARK: - Helper Functions

    private func configureCollectionViews() {
        let collectionViews = [categoryCollectionView, dishesCollectionView, specialsCollectionView]
        
        collectionViews.forEach({
            $0?.delegate = self
            $0?.dataSource = self
        })
        
        categoryCollectionView.register(
            CategoriesCollectionViewCell.nib(),
            forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier
        )
        
        dishesCollectionView.register(
            DishesCollectionViewCell.nib(),
            forCellWithReuseIdentifier: DishesCollectionViewCell.identifier
        )
        
        specialsCollectionView.register(
            SpecialsCollectionViewCell.nib(),
            forCellWithReuseIdentifier: SpecialsCollectionViewCell.identifier
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
            case specialsCollectionView:
                return specials.count
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
                
            case specialsCollectionView:
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SpecialsCollectionViewCell.identifier,
                        for: indexPath
                    ) as? SpecialsCollectionViewCell
                else {
                    return UICollectionViewCell()
                }
                
                cell.setup(specials[indexPath.row])
                return cell
            default:
                return UICollectionViewCell()
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension HomeController: UICollectionViewDelegate {
    
    ///
    /// - if we clicked on any item of the category collection view do something
    ///
    /// - if we clicked on any item of the dishes or the specials collection views
    ///   switch each case and pass the right item from the equivelant array to
    ///   the dish details controller
    ///
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            //
        } else {
            ///
            /// instantiate() comes from the view controller extension file
            ///
            let controller = DishDetailsController.instantiate()
            
            switch collectionView {
                case dishesCollectionView:
                    controller.dish = dishes[indexPath.row]
                case specialsCollectionView:
                    controller.dish = specials[indexPath.row]
                default:
                    controller.dish = dishes[indexPath.row]
            }
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
