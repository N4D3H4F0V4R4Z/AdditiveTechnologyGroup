//
//  AppDelegate.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //  UI
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Приложение загрузилось!")
        configure()
        
        return true
    }
}

// MARK: -
// MARK: - Configure

private extension AppDelegate {
    
    func configure() {
        configureRootViewController()
    }
    
    func configureRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
    }
    
}

