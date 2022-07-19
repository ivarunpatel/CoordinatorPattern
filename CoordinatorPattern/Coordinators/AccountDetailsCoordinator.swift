//
//  AccountDetailsCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 03/05/22.
//

import Foundation

class AccountDetailsCoordinator: BaseCoordinator {
    private let router: RouterProtocol

    init(router: RouterProtocol) {
        self.router = router
    }

    override func start() {
        let accountDetailsVC = AccountDetailsVC.instantiate()
        accountDetailsVC.coordinator = self
        router.push(accountDetailsVC, isAnimated: true, onNavigateBack: self.isCompleted)
    }
    
    func showChangePassword() {
        let changePasswordCoordinator = ChangePasswordCoordinator(router: router)
        self.start(coordinator: changePasswordCoordinator)
    }
    
    func logout() {
        UserDefaults.standard.isLoggedIn = false
    }
}


