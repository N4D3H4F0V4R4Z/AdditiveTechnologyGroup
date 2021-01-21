//
//  TabBarViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

// MARK: -
// MARK: - Configure

private extension TabBarViewController {
    
    func configure() {
        configureViewController()
        configureTabBar()
    }
    
    func configureViewController(){
        
        let slidersVC = UIStoryboard(name: "Sliders", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let slidersTabBarItem = UITabBarItem()
        slidersTabBarItem.title = "Price Calculator"
        slidersTabBarItem.image = UIImage(named: "sliders")
        slidersTabBarItem.selectedImage = UIImage(named: "slidersSelected")
        slidersVC.tabBarItem = slidersTabBarItem
        
        let aboutVC = UIStoryboard(name: "Content", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let aboutTabBarItem = UITabBarItem()
        aboutTabBarItem.title = "About us"
        aboutTabBarItem.image = UIImage(named: "about")
        aboutTabBarItem.selectedImage = UIImage(named: "aboutSelected")
        aboutVC.tabBarItem = aboutTabBarItem
        
        let contactVC = UIStoryboard(name: "Contact", bundle: nil).instantiateInitialViewController() as! UIViewController
        let contactTabBarItem = UITabBarItem()
        contactTabBarItem.title = "Contact"
        contactTabBarItem.image = UIImage(named: "contact")
        contactTabBarItem.selectedImage = UIImage(named: "contactSelected")
        contactVC.tabBarItem = contactTabBarItem
        
        viewControllers = [slidersVC, aboutVC, contactVC]
    }
    
    func configureTabBar(){
        tabBar.tintColor = .black
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.white
    }
    
}
