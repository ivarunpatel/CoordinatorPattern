//
//  ProductDetailsCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import Foundation

final class ProductDetailsCoordinator: BaseCoordinator {
    
   private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }

    override func start() {
        let ProductDetailsVC = ProductDetailsVC.instantiate()
        ProductDetailsVC.coordinator = self
        router.push(ProductDetailsVC, isAnimated: true, onNavigateBack: self.isCompleted)
    }
    
    func addToCart() {
        let checkOutVC = CheckOutVC.instantiate()
        checkOutVC.delegate = self
        router.push(checkOutVC, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}

// MARK: - CheckOutDelegate
extension ProductDetailsCoordinator: CheckOutDelegate {
    func didPlaceOrderSuccessfully() {
        router.popToRoot(true)
    }
}

