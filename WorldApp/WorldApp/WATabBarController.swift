//
//  ViewController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let photoController = WAPhotoController()
        photoController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites,
                                                  tag: 0)

        let placesController = WAPlacesController()
        placesController.tabBarItem = UITabBarItem(title: "Places",
                                                   image: UIImage(systemName: "globe"),
                                                   selectedImage: nil)

        let settingsController = WASettingsController()
        settingsController.tabBarItem = UITabBarItem(title: "Settings",
                                                     image: UIImage(named: "tabBarSettingsIcon"),
                                                     tag: 2)

        self.setViewControllers([
            UINavigationController(rootViewController: settingsController),
            UINavigationController(rootViewController: photoController),
            UINavigationController(rootViewController: placesController)],
                                animated: true)

        self.setTabBarAppearance()
    }

    func setTabBarAppearance() {
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .magenta
        self.tabBar.itemPositioning = .fill
//        self.tabBar.isTranslucent = true
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = self.tabBar.items?.firstIndex(of: item),
              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else {
            return }
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut) {
            imageView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)

            UIView.animate(withDuration: 0.5,
                           delay: 0.2,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut) {
                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}
