//
//  TabBarVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class TabBarVC: UITabBarController, Storyboarded {

    let productCoordinator = ProductCoordinator()
    let myAccountCoordinator = MyAccountCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    // MARK: - Custom Functions
    private func setupView() {
        
        productCoordinator.start()
        myAccountCoordinator.start()

        setupTabBarUI()
        setupTabBarController()
    }
    
    private func setupTabBarUI() {
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .secondarySystemBackground
        self.tabBar.barTintColor = .lightGray
        self.tabBar.tintColor = UIColor.systemRed
    }
    
    private func setupTabBarController() {
        viewControllers = [productCoordinator.router.navigationController, myAccountCoordinator.router.navigationController]
    }
    
}
