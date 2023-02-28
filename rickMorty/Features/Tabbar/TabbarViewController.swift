//
//  TabbarViewController.swift
//  rickMorty
//
//  Created by Lorena on 27/02/23.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabbarController()
    }

    private func setupTabbarController(){
        
        let homeTabbar = HomeVC()
//        let favoritesTabbar =
//        let profileTabbar =
        setViewControllers([homeTabbar], animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.barTintColor = .lightGray
        
        guard let tabBarItem = tabBar.items else {return}
        
        tabBarItem[0].title = "Home"
        tabBarItem[0].image = UIImage(systemName: "house")
        
//        tabBarItem[1].title = "Favoritos"
//        tabBarItem[1].image = UIImage(systemName: "star")
//
//        tabBarItem[2].title = "Perfil"
//        tabBarItem[2].image = UIImage(systemName: "person")
    }


}
