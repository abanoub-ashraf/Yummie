import UIKit

class OnboardingController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Properties
    
    var slides: [OnboardingSlideModel] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    // MARK: - IBActions

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            guard
                let homeController = storyboard?.instantiateViewController(
                    identifier: "HomeNC"
                ) as? UINavigationController
            else {
                return
            }
            
            homeController.modalPresentationStyle = .fullScreen
            homeController.modalTransitionStyle = .flipHorizontal
            
            present(homeController, animated: true, completion: nil)
        } else {
            currentPage += 1
        
            let indexPath = IndexPath(item: currentPage, section: 0)
        
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlideModel(
                title: "Delicious",
                description: "Experience a variety of amazing dishes from different cultures around the world.",
                image: #imageLiteral(resourceName: "slide2")
            ),
            OnboardingSlideModel(
                title: "World-Class Chefs",
                description: "Our dishes are prepared by only the best.",
                image: #imageLiteral(resourceName: "slide1")
            ),
            OnboardingSlideModel(
                title: "Instant World-Wide Delivery",
                description: "Your orders will be delivered instantly irrespective of your location around the world.",
                image: #imageLiteral(resourceName: "slide3")
            )
        ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.numberOfPages = slides.count
    }

}

// MARK: - UICollectionViewDataSource

extension OnboardingController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OnboardingCollectionViewCell.identifier,
                for: indexPath
            ) as? OnboardingCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension OnboardingController: UICollectionViewDelegate {
    
    ///
    /// when i scroll to the enxt cell in the collection view
    /// update the page control to be the next one as well to match the scroll
    ///
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        ///
        /// - width is the width of the horizontal collection view
        ///
        /// - current page is the offest.x / width to get the exact current page
        ///
        let width = scrollView.frame.width
        
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
