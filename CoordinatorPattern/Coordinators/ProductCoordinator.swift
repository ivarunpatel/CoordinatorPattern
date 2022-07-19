//
//  ProductCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import Foundation
import UIKit

final class ProductCoordinator: BaseCoordinator {
    
    let router = Router(navigationController: UINavigationController())
    
    override func start() {
        let productListVC = ProductListVC.instantiate()
        productListVC.coordinator = self
        let tabBarItem = UITabBarItem(title: "Product List", image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"), selectedImage: nil)
        productListVC.tabBarItem = tabBarItem
        router.navigationController.viewControllers = [productListVC]
    }

    
    func showProductDetails() {
        let productDetailsCoordinator = ProductDetailsCoordinator(router: router)
        self.start(coordinator: productDetailsCoordinator)
    }
}
