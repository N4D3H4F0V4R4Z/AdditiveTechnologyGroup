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
        
    }

    func configureTabBar(){
        tabBar.tintColor = .black
        tabBar.barTintColor = .gray
    }

}
