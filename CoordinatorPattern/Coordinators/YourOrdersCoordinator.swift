//
//  YourOrdersCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 03/05/22.
//

import Foundation

class YourOrdersCoordinator: BaseCoordinator {
    private let router: RouterProtocol

    init(router: RouterProtocol) {
        self.router = router
    }

    override func start() {
        let yourOrdersListVC = YourOrdersListVC.instantiate()
        yourOrdersListVC.coordinator = self
        router.push(yourOrdersListVC, isAnimated: true, onNavigateBack: self.isCompleted)
    }
    
    func showProductDetails() {
        let productDetailsCoordinator = ProductDetailsCoordinator(router: router)
        self.start(coordinator: productDetailsCoordinator)
    }
}
