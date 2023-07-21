//
//  PhotoTabBarController.swift
//  Homework14(Photos)
//
//  Created by Михаил Латий on 21.07.2023.
//

import UIKit

class PhotoTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }

    func setupTabBarController() {
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white

    }

    func setupTabBarViewControllers() {
        let first =  UINavigationController(rootViewController: LibraryViewController())
        let firstIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        first.tabBarItem = firstIcon

        let second =  UINavigationController(rootViewController: ForYouViewController())
        let secondIcon = UITabBarItem(title: "For you" , image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        second.tabBarItem = secondIcon

        let third =  UINavigationController(rootViewController: AlbumViewController())
        let thirdIcon = UITabBarItem(title: "Albums" , image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        third.tabBarItem = thirdIcon

        let fourth =  UINavigationController(rootViewController: SearchViewController())
        let fourthIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        fourth.tabBarItem = fourthIcon

        let controllers = [first, second, third, fourth]
            self.setViewControllers(controllers, animated: true)
    }
}



