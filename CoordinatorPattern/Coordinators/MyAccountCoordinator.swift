//
//  MyAccountCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import Foundation
import UIKit

final class MyAccountCoordinator: BaseCoordinator {

    let router = Router(navigationController: UINavigationController())
    
    override func start() {
        let myAccountVC = MyAccountVC.instantiate()
        myAccountVC.coordinator = self
        let tabBarItem = UITabBarItem(title: "My Account", image: UIImage(systemName: "person.crop.circle.fill"), selectedImage: nil)
        myAccountVC.tabBarItem = tabBarItem
        router.navigationController.viewControllers = [myAccountVC]
    }
    
    func showYourOrdersList() {
        let yourOrdersCoordinator = YourOrdersCoordinator(router: router)
        self.start(coordinator: yourOrdersCoordinator)
    }
    
    func showAccountDetails() {
        let accountDetailsCoordinator = AccountDetailsCoordinator(router: router)
        self.start(coordinator: accountDetailsCoordinator)
    }
}
