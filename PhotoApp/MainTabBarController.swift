import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    func setupTabBar() {

        let mediaLibraryVC = createNavController(vc: PhotoViewController(), itemName: "Медиатека", itemImage: "photo.on.rectangle")
        let forYouVC = createNavController(vc: PhotoViewController(), itemName: "Для Вас", itemImage: "heart.text.square.fill")
        let albumsVC = createNavController(vc: PhotoViewController(), itemName: "Альбомы", itemImage: "rectangle.stack.fill")
        let searchVC = createNavController(vc: PhotoViewController(), itemName: "Поиск", itemImage: "magnifyingglass")

        viewControllers = [mediaLibraryVC, forYouVC, albumsVC, searchVC]
    }

    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {

        let item = UITabBarItem(
            title: itemName,
            image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)),
            tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 5)

        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        navController.navigationBar.prefersLargeTitles = true

        return navController
    }
}
